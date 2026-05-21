from pathlib import Path
import pandas as pd


def load_csv(file_path: str | Path) -> pd.DataFrame:
    """Load a CSV file into a pandas DataFrame."""
    return pd.read_csv(file_path)


def standardize_dates(df: pd.DataFrame, date_columns: list[str]) -> pd.DataFrame:
    """Convert selected columns to datetime."""
    for col in date_columns:
        df[col] = pd.to_datetime(df[col])
    return df


def add_month_column(
    df: pd.DataFrame,
    source_column: str,
    new_column: str
) -> pd.DataFrame:
    """Create a YYYY-MM month column from a date column."""
    df[new_column] = pd.to_datetime(df[source_column]).dt.to_period("M").astype(str)
    return df


def clean_text_columns(df: pd.DataFrame, text_columns: list[str]) -> pd.DataFrame:
    """Fill missing text values and strip extra whitespace."""
    for col in text_columns:
        df[col] = df[col].fillna("Unknown").astype(str).str.strip()
    return df


def clean_numeric_columns(df: pd.DataFrame, numeric_columns: list[str]) -> pd.DataFrame:
    """Convert selected columns to numeric values and fill missing values with zero."""
    for col in numeric_columns:
        df[col] = pd.to_numeric(df[col], errors="coerce").fillna(0)
    return df


def save_csv(df: pd.DataFrame, output_file: str | Path) -> None:
    """Save a DataFrame to CSV."""
    df.to_csv(output_file, index=False)
    print(f"Saved cleaned file to {output_file}")
    print(df.head())