class ControlController < ApplicationController
  def update
    port_str = "/dev/ttyUSB0"  #may be different for you
    baud_rate = 9600
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE

    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    flash[:notice] = "Sent command successfully!"
    render nothing:true, status: 200 if sp.write(params[:command])
  rescue Exception => e
    flash[:error] = e.message
    render nothing: true, status: 500
  end
end
