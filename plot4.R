draw_plot4 <- function(data = NULL){
    # load helper functions with general_draw
    source('helper.R')
    
    # check if data argument is provided
    if(is.null(data)){
        # loading data from household_power_consumption
        data <- load_data()
    }
    
    # making datetime from separete date and time columns
    datetime <- as.POSIXct(paste(data$Date, data$Time))
    
    # init graphic device
    png('plot4.png', bg = 'transparent')
    
    # setting parameters for multiple plots on graphic device
    par(mfcol = c(2,2))

    # drawing 4 plots to one graphic device
    # topleft plot
    plot(datetime, mydata$Global_active_power, type = 'l', ylab = 'Global Active Power', xlab = '')
    
    # bottomleft
    plot(datetime, mydata$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
    lines(datetime, mydata$Sub_metering_2, col = 'red')
    lines(datetime, mydata$Sub_metering_3, col = 'blue')
    legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=c(1,1,1), col = c('black', 'red', 'blue'))
    
    # toprigth plot
    with(data, plot(datetime, Voltage, type = 'l'))
    
    # bottomright plot
    with(data, plot(datetime, Global_reactive_power, type = 'l'))
    
    # closing graphic device
    dev.off()
}