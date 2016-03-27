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
      				<b> Name: </b> #{params[:name]}<br>
      				<b> Email: </b> #{params[:mail]}<br>
      				<b> Phone: </b> #{params[:phone]}<br>
      				<b> Secondary Phone: </b> #{params[:phone2]}<br>
      				<b> How did you hear about us: </b> #{params[:refer]}<br>
      				<b> Date 1: </b> #{params[:date1]}<br>
      				<b> Date 2: </b> #{params[:date2]}<br>
      				<b> Date 3: </b> #{params[:date3]}<br>
      				<b> Date details: </b> #{params[:datedetails]}<br>
      				<b> Starting address: </b> #{params[:starting]}<br>
      				<b> Stairs @ start: </b> #{params[:stairs_start]}<br>
      				<b> Details @ start: </b> #{params[:stairdetails_start]}<br>
      				<b> COI needed? </b> #{params[:certificate]}<br>
      				<b> Ending address: </b> #{params[:ending]}<br>
      				<b> Stairs @ end: </b> #{params[:stairs_end]}<br>
					<b> Details @ end: </b> #{params[:stairdetails_end]}<br>    				
      				<b> Deadlines: </b> #{params[:deadlines]}<br>
      				<b> Furniture list: </b> #{params[:furniture]}<br>
      				<b> Valuables: </b> #{params[:valuable]}<br>
      				<b> Assembly? </b> #{params[:assemble]}<br>
      				<b> Small boxes: </b> #{params[:smallbox]}<br>
      				<b> Medium boxes: </b> #{params[:mediumbox]}<br>
      				<b> Large boxes: </b> #{params[:largebox]}<br>
      				<b> Wardrobe boxes: </b> #{params[:wardrobebox]}<br>
      				<b> Other items: </b> #{params[:other_items]}<br>
      				<b> Other info: </b> #{params[:other]}
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