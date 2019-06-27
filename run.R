library(tabulizer)

arguments <- commandArgs(trailingOnly = TRUE)

f <- arguments[1]
p <- arguments[2]

tab <- extract_tables(f,p)

if(is.list(tab) && !is.data.frame(tab)) {
  
  tab <- tab[[1]]

}

out_path <- paste0("output/",tools::file_path_sans_ext(f), "_", p, ".csv")

res_out <- try(write.csv(tab, file = out_path, row.names = FALSE))

if(is.null(res_out)) {

  message(sprintf("\nSUCCESS\ntable from %s (page %s) parsed and written to %s (%d rows)\n", f, p, out_path, nrow(tab)))

} else {

  message(sprintf("\nFAILURE\n%s\n", res_out))

}
