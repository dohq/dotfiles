# your link goes here
link = "https://github.com/Japont/Japont-fonts/blob/54e809086cfca96a9f7459f70dfe65476660f58d/fontna-mplus/NikumaruFont.woff"

# note: this will break if a repo/organization or subfolder is named "blob" -- would be ideal to use a fancy regex
# to be more precise here
print(link.replace("github.com", "raw.githubusercontent.com").replace("/blob/", "/"))

# example output link:
# https://raw.githubusercontent.com/knightlab-analyses/qurro-mackerel-analysis/master/AnalysisOutput/qurro-plot.qzv
