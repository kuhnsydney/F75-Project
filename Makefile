all: reports/report_SK.html

output/figures/boxplot_bfeeding_days.rds output/figures/boxplot_bfeeding_days.png: code/code_bfeeding_daysstable.R data/raw/f75_interim.csv
	Rscript code/code_bfeeding_daysstable.R

reports/report_SK.html: reports/report_SK.Rmd output/figures/boxplot_bfeeding_days.rds
	Rscript -e "rmarkdown::render('reports/report_SK.Rmd')"

.PHONY: clean
clean:
	rm -f output/figures/*.rds output/figures/*.png reports/*.html