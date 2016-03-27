require 'sinatra'
require 'sendgrid-ruby'
# require 'sinatra/flash'
# require 'valid_email'
# require 'valid_email/validate_email'
# set :port, 9494
# enable :sessions

get '/' do 
  erb :home
end

post '/email' do 
  # if ValidateEmail.valid?(params[:mail])
    client = SendGrid::Client.new(api_key: ENV['SENDGRID_API_KEY'])
    email = SendGrid::Mail.new do |m|
      m.to      = 'liana.schapiro@gmail.com'
      m.from    = params[:mail]
      m.subject = 'Email Sent From Stride Movers'
      m.html    = "<style='font-size:16px'>
      				<b> Name: </b> #{params[:name]}<br>\r\n\r\n
      				<b> Email: </b> #{params[:mail]}<br>\r\n\r\n
      				<b> Phone: </b> #{params[:phone]}<br>\r\n\r\n
      				<b> Secondary Phone: </b> #{params[:phone2]}<br>\r\n\r\n
      				<b> How did you hear about us: </b> #{params[:refer]}<br>\r\n\r\n
      				<b> Date 1: </b> #{params[:date1]}<br>\r\n\r\n
      				<b> Date 2: </b> #{params[:date2]}<br>\r\n\r\n
      				<b> Date 3: </b> #{params[:date3]}<br>\r\n\r\n
      				<b> Date details: </b> #{params[:datedetails]}<br>\r\n\r\n
      				<b> Starting address: </b> #{params[:starting]}<br>\r\n\r\n
      				<b> Stairs @ start: </b> #{params[:stairs_start]}<br>\r\n\r\n
      				<b> Details @ start: </b> #{params[:stairdetails_start]}\r\n\r\n
      				<b> COI needed? </b> #{params[:certificate]}\r\n\r\n
      				<b> Ending address: </b> #{params[:ending]}\r\n\r\n
      				<b> Stairs @ end: </b> #{params[:stairs_end]}\r\n\r\n
					<b> Details @ end: </b> #{params[:stairdetails_end]}\r\n\r\n 				
      				<b> Deadlines: </b> #{params[:deadlines]}\r\n\r\n
      				<b> Furniture list: </b> #{params[:furniture]}\r\n\r\n
      				<b> Valuables: </b> #{params[:valuable]}\r\n\r\n
      				<b> Assembly? </b> #{params[:assemble]}\r\n\r\n
      				<b> Small boxes: </b> #{params[:smallbox]}\r\n\r\n
      				<b> Medium boxes: </b> #{params[:mediumbox]}\r\n\r\n
      				<b> Large boxes: </b> #{params[:largebox]}\r\n\r\n
      				<b> Wardrobe boxes: </b> #{params[:wardrobebox]}\r\n\r\n
      				<b> Other items: </b> #{params[:other_items]}\r\n\r\n
      				<b> Other info: </b> #{params[:other]}\r\n\r\n
      				</style>"
    end
  if client.send(email)
    # flash[:notice]="You've messaged me, I'll get back to you asap!"
    redirect '/'
  else
    # flash[:notice]="Please use a properly formatted email address!"
    redirect '/#quote'
  end
end

get '/resume' do 
  erb :resume
end