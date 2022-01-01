#!/Users/hanmeiTang/miniconda3/bin/python

import os
import dateutil.parser as dparser
import pandas as pds

from pymatgen.util.plotting import pretty_plot

__version__ = "1.0"
__maintainer__ = "Hanmei Tang"

KG_2_LBS = 2.20462  # lbs/kg


def get_df_from_data_file(data_file):
    df = pds.read_csv(data_file, sep=";\s?", index_col=None, engine='python')
    df.fillna(value="lbs", inplace=True)
    df = df[["Date", "Weight", "unit"]]
    return df


def convert_to_lbs(row):
    if row["unit"] == "lbs":
        return row['Weight']
    else:  # row["unit"] == "kg"
        return row["Weight"] * KG_2_LBS


def convert_to_kg(row):
    if row["unit"] == "lbs":
        return row['Weight'] / KG_2_LBS
    else:  # row["unit"] == "kg"
        return row["Weight"]


class WeightTracker:
    def __init__(self,
                 csv_file="/Users/hanmeiTang/repos/hatGit"
                          "/research/cat/weight.csv"):
        self.csv_file = csv_file
        self.data_df = get_df_from_data_file(csv_file)

    @staticmethod
    def standard_date_str(date):
        """Parse data string to standard format"""
        date = dparser.parse(date, fuzzy=True)
        date_str = "{:02d}-{:02d}-{:02d}".format(
            date.year, date.month, date.day)

        return date_str

    def get_record_from_date(self, date):
        """
        Check data at one day is existing or not.
        Args:
            date (str): 2018-08-01
        Returns:
            record_df
        """
        df = self.data_df
        date = dparser.parse(date, fuzzy=True)
        date_str = "{:02d}-{:02d}-{:02d}".format(date.year, date.month,
                                                 date.day)
        if df[df["Date"] == date_str].size == 3:
            record = df[df["Date"] == date_str]
        else:
            print("Date not found in records!")
            record = None
        return record

    def update_record(self, date, weight, unit="kg", overwrite=True):
        df = self.data_df
        date = self.standard_date_str(date)
        record = self.get_record_from_date(date)

        # Update existing record
        if record is not None:
            ind = record.index[0]
            d = df.to_dict()
            d["Weight"][ind] = weight
            d["unit"][ind] = unit
            df_new = pds.DataFrame.from_dict(d)
            print("Updated record on {} from {:.2f} {} to {:.2f} {}.".format(
                date, record["Weight"][ind], record["unit"][ind], weight, unit))
        else:  # Add a new record
            print("Added record on {}: {:.2f} {}.".format(date, weight, unit))
            temp = pds.DataFrame([[date, weight, unit]],
                                 columns=["Date", "Weight", "unit"])
            df_new = df.append(temp, ignore_index=True)

        df_new.sort_values(by="Date", inplace=True)
        df_new = df_new[["Date", "Weight", "unit"]]
        if overwrite:
            df_new.to_csv(self.csv_file, sep=";")

        return df_new

    def plot_weight_from_csv(self, save_plot=None, xlim=None, ylim=None,
                             annotates=None, axhlines=None, ms=10, lw=3,
                             weight_unit="lbs", xy_edge=(12, 8)):
        """
        Plot figure from a given csv file.

        Args:
            save_plot (str): saved file name
            xlim (tuple): xlim
            ylim (tuple): ylim
            annotates (List(dict)): a list of annotations
            axhlines (List(dict)): a list of axial horizontal lines
            ms (int): marker size
            lw (int): line width
            weight_unit (str): select from lbs and kg
            xy_edge (tuple): x and y length

        Returns:
            matplotlib.pyplot object
        """
        df = self.data_df

        if weight_unit == "lbs":
            apply_func = convert_to_lbs
        elif weight_unit == "kg":
            apply_func = convert_to_kg
        else:
            raise ValueError("Please select from lbs and kg!")

        df["weight"] = df.apply(apply_func, axis=1)

        p = pretty_plot(*xy_edge)
        p.plot(df["Date"], df['weight'], marker="s", ms=ms, lw=lw)

        p.xticks(rotation=85, fontsize=20)
        p.yticks(fontsize=20)
        p.ylabel("Weight ({})".format(weight_unit), fontsize=24)

        annotates = annotates or {}
        axhlines = axhlines or {}

        for annotate in annotates:
            p.annotate(**annotate)

        for axhline in axhlines:
            p.axhline(**axhline)

        if ylim is not None:
            p.ylim(*ylim)

        if xlim is not None:
            p.xlim(*xlim)

        p.tight_layout()

        if save_plot is not None:
            p.savefig(save_plot, dpi=100)

        return p

    @staticmethod
    def pretty_plot_for_zombie():
        src_dir = "/Users/hanmeiTang/repos/hatGit/research/cat"
        fs = 24
        font = {"alpha": 0.6, "fontsize": fs}

        annotates = [
            dict(s="$W_{avg}$ = 8.6 lbs.", xy=(0, 9), **font),
            dict(s="Oh, this is \nheartbreaking...", xy=(0.6, 13.8), **font),
            dict(s="Zombie's goal = 12 lbs.", xy=(0, 12.4), fontsize=fs),
            dict(s="No, you have to \ncontrol yourself!", xy=(2.6, 16.2),
                 **font)]

        axhlines = [
            # the average weight of the adult
            # un-neutered male (tom) is 8.6 pounds
            dict(y=8.6, ls="--", lw=10, alpha=0.4, c="k"),
            # the goal for Zombie
            dict(y=12, ls="--", lw=10, alpha=0.4, c="g")]

        dest = "/Users/hanmeiTang/bin/HanmeiTang.github.io/" \
               "source/content/images/2018/06"
        fig_name = os.path.join(dest, "2018-06-21-Zombie_weight.png")

        wt = WeightTracker(os.path.join(src_dir, "./weight.csv"))
        plt = wt.plot_weight_from_csv(fig_name, axhlines=axhlines,
                                      annotates=annotates, ylim=(8, 18),
                                      weight_unit="lbs")
        plt.show()

        print("Weight updated!")


if __name__ == "__main__":
    pass
