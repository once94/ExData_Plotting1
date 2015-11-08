draw_plot4 <- function(data = NULL){
    # load helper functions with general_draw
    source('helper.R')
    
    # check if data argument is provided
    if(is.null(data)){
        # loading data from household_power_consumption
        data <- load_data()
    }
    
    # loading files for drawing other plots
    source('plot2.R')
    source('plot3.R')
    
    # making datetime from separete date and time columns
    datetime <- as.POSIXct(paste(data$Date, data$Time))
    
    # init graphic device
    png('plot4.png', bg = 'transparent')
    
    # setting parameters for multiple plots on graphic device
    par(mfcol = c(2,2))

    # drawing plots
    draw_plot2(data = data, draw_to_device = FALSE)
    draw_plot3(data = data, draw_to_device = FALSE)
    with(data, plot(datetime, Voltage, type = 'l'))
    with(data, plot(datetime, Global_reactive_power, type = 'l'))
    
    # closing graphic device
    dev.off()
}