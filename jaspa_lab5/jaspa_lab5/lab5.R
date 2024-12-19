# Author: Adrian Joel Jaspa
# Lab 5

#Libraries USED
library(seqinr)#for bioinformatics
library(ggplot2)#for plotting
library(reshape2)#for plotting
library(gridExtra)#for the tables in plots


calculate_gc_content <- function(sequence) {#calculates the contents of each GCX
  codons <- substring(sequence, seq(1, nchar(sequence), by=3), seq(3, nchar(sequence), by=3)) #Gets the first 3 and it loops starting from 1, then 4, then 7, and so on
  #calculates the nucleotides of the first, second, and third positions
  gc1 <- sum(substring(codons, 1, 1) %in% c("G", "C")) / length(codons) * 100 
  gc2 <- sum(substring(codons, 2, 2) %in% c("G", "C")) / length(codons) * 100
  gc3 <- sum(substring(codons, 3, 3) %in% c("G", "C")) / length(codons) * 100
  #calculates the overall nucleotides
  gc4 <- (sum(charToRaw(sequence) %in% charToRaw("G")) + sum(charToRaw(sequence) %in% charToRaw("C"))) / nchar(sequence) * 100
  
  #returns the percentages of all 4
  return(c(gc1, gc2, gc3, gc4))
}

# Reading the FASTA file, try catch error
fasta_file_path <- "C:/Users/asus/Documents/4th Year/124/jaspa_lab5/Sequences.fasta"
fasta_sequences <- tryCatch({
  read.fasta(file = fasta_file_path)
}, error = function(e) {
  #if not found
  cat("Error reading FASTA file:", e$message, "\n")
  return(NULL)
})

#checks if the file was successfully accessed
if (!is.null(fasta_sequences)) {
  #initialize the data that is empty to store the results every time
  gc_content_results <- data.frame(Sequence = character(), GC1 = numeric(), GC2 = numeric(), GC3 = numeric(), GC4 = numeric(), stringsAsFactors = FALSE)
  #loops eacg time
  for (seq_name in names(fasta_sequences)) {
    sequence <- toupper(c2s(fasta_sequences[[seq_name]]))
    
    #skips if the sequence is not divisible by 3
    if (nchar(sequence) == 0 || nchar(sequence) %% 3 != 0) {
      cat("Skipping sequence:", seq_name, "- invalid sequence.\n")
      next  # Skip this sequence if empty or not multiple of 3
    }
    #stores the result and appends it
    gc_values <- calculate_gc_content(sequence)
    gc_content_results <- rbind(gc_content_results, data.frame(Sequence = seq_name, GC1 = gc_values[1], GC2 = gc_values[2], GC3 = gc_values[3], GC4 = gc_values[4]))
  }
  
  #prints the results
  print(gc_content_results) #prints every result
  grid.table(gc_content_results) #creates a table to be shown in the plots tab
  write.csv(gc_content_results, "GC_content_results.csv", row.names = FALSE)
  gc_melted <- melt(gc_content_results, id.vars = "Sequence")
  gc_types <- c("GC1", "GC2", "GC3", "GC4")
  
  #Create a bar graph for each GC as requested
  for (gc_type in gc_types) {
    plot_data <- gc_melted[gc_melted$variable == gc_type, ]
    
    plot <- ggplot(plot_data, aes(x = Sequence, y = value, fill = variable)) +
      geom_bar(stat = "identity", position = position_dodge(width = 0.8)) +
      labs(title = paste("GC Content -", gc_type), x = "Sequence", y = "GC Content (%)") +
      scale_fill_manual(values = c("GC1" = "blue", "GC2" = "red", "GC3" = "yellow", "GC4" = "green")) +
      theme(
        panel.background = element_rect(fill = "white"),
        plot.background = element_rect(fill = "white"),
        axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 8),
        axis.ticks.length = unit(0.5, "cm")
      )
    
    # Save the plot
    ggsave(filename = paste(gc_type, "_GC_content_bar_graph.png", sep = ""), plot = plot)
  }
  
} else { #if there is no file
  cat("No sequences available for processing.\n")
}
