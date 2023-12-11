import sqlite3
from config import settings
import typer
from pathlib import Path
from rich import print
import pandas as pd
from src import execute_query
from datetime import date

app = typer.Typer()
df_flows = pd.read_csv("flows.csv")


@app.command()
def init_dw():
    """Create a small data warehouse with all the relevant tables for AgilePM
    """

    def run_flow():
        """Runs the flow for initializing the data warehouse"""
        # Get the initialize workflow
        init_workflow = df_flows.loc[df_flows["Workflow"] == "initialize", :].sort_values(by="Step", ascending=True)

        # Execute each query of the workflow
        for i, row in init_workflow.iterrows():
            execute_query.main(row["File"])

    # Check if database already exists
    if Path(settings.db_name).exists():
        print("[bold red]Alert![/bold red] The database already exists.")
        confirm = typer.confirm("Do you want to create a new one and archive the later?")
        if confirm:
            # Archive old database
            old_path = Path(settings.db_name)
            new_path = Path.cwd().joinpath("archives", f"warehouse_{date.today()}.db")
            Path(old_path).rename(new_path)

            # Create a new database
            run_flow()
            print("[bold green]Success![/bold green] Everything went fine.")
        else:
            print("Nothing as been touched. Carry on, nothing to see here.")
    else:
        # Create a new database
        run_flow()

@app.command()
def setup_gantt(gantt_file):
    """Setup the xml of the gantt project to be compatible with AgilePM."""



if __name__ == "__main__":
    app()
