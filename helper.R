## loading data from file
load_data <- function(filename = '../household_power_consumption.txt'){
    library(data.table)
    
    # loading data from text input, setting NA value
    rawdata <- fread(filename, na.strings = "?")
    
    # setting the class of column
    rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
    
    # subsetting only 2 days of all data
    data_day1 <- rawdata[rawdata$Date == as.Date("2007-02-01")]
    data_day2 <- rawdata[rawdata$Date == as.Date("2007-02-02")]
    
    # bindig subsets together
    rbind(data_day1, data_day2)
}

## function that can draw directly to graphic device or just output a plot for another graphic device
genereal_draw <- function(name, plot_function, data = NULL, draw_to_device = TRUE){
    # check if data argument is provided
    if(is.null(data)){
        # loading data from household_power_consumption
        data <- load_data()
    }
    
    # drawing histogram to PNG graphic device
    if(draw_to_device){
        # init graphic device
        png(paste(name,'.png', sep = ''), bg = 'transparent')
        
        # draw some graph
        plot_function(data)
        
        # close graphic device
        dev.off()
    }
    else {
        # drawing the without device
        plot_function(data)
    }
}