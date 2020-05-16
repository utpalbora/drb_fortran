# Author: Utpal Bora <cs14mtech11017@iith.ac.in>
# Institute: IIT Hyderabad, India
# Date: 13th April 2020
from __future__ import division
import pandas as pd
from os import path

# tools and dataframes
datasource = {
    'llov': 'results/llov.csv',
    'drd': 'results/drd.csv',
    'helgrind': 'results/helgrind.csv'
}

# Statistical Classification of results
def statsclass(x):
    if x['haverace'] and x['races-max'] > 0:
        return 'TP'
    if x['haverace'] and x['races-max'] == 0:
        return 'FN'
    if not x['haverace'] and x['races-max'] > 0:
        return 'FP'
    if not x['haverace'] and x['races-max'] == 0:
        return 'TN'
    else:
        ''


stats = pd.DataFrame(columns=('tool', 'precision', 'recall', 'accuracy',
                              'F1 Score', 'DOR'))
TPstats = pd.DataFrame(columns=('tool', 'TP', 'FN', 'TN', 'FP'))

for tool, ds in datasource.items():
    if not path.isfile(ds):
        continue
    df = pd.read_csv(ds)
    groupby_id = df.groupby(['id', 'haverace'])
    minraces = groupby_id.min().reset_index()[['id', 'haverace', 'races']]
    maxraces = groupby_id.max().reset_index()[['id', 'races']]
    # minraces.to_csv('minraces.csv', index=False)
    # maxraces.to_csv('maxraces.csv', index=False)
    minmax = pd.merge(minraces, maxraces, how='inner', on='id',
                      suffixes=('-min', '-max'))
    minmax['outcome'] = minmax.apply(lambda row: statsclass(row), axis=1)
    minmax.to_csv('results/'+tool+'-minmax.csv', index=False,
                  float_format='%.0f')

    TP = (minmax.outcome == 'TP').sum()
    TN = (minmax.outcome == 'TN').sum()
    FP = (minmax.outcome == 'FP').sum()
    FN = (minmax.outcome == 'FN').sum()

    pre = (TP / (TP + FP))
    rec = (TP / (TP + FN))
    acc = ((TP + TN) / (TP + FP + TN + FN))
    f1 = (2*(pre*rec)/(pre+rec))

    TPR = rec
    FPR = (FP / (FP + TN))
    FNR = (FN / (FN + TP))
    TNR = (TN / (TN + FP))
    LRp = (TPR / FPR)
    LRm = (FNR / TNR)
    DOR = (LRp / LRm)

    stats = stats.append({'tool': tool, 'precision': pre, 'recall': rec,
                          'accuracy': acc, 'F1 Score': f1, 'DOR': DOR},
                         ignore_index=True)
    TPstats = TPstats.append({'tool': tool, 'TP': TP, 'FN': FN, 'TN': TN,
                              'FP': FP}, ignore_index=True)

stats.to_csv('results/Stats.csv', index=False, float_format='%.2f')
TPstats.to_csv('results/TP-Stats.csv', index=False, float_format='%.0f')
