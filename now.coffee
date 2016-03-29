# Arbitrarily edited by Girai Kaku [kakugirai@gmail.com] while lovingly crafted by Rohan Likhite [rohanlikhite.com]

command: "finger `whoami` | awk -F: '{ print $3 }' | head -n1 | sed 's/^ // '"


#Refresh time (default: 1/2 minute 30000)
refreshFrequency: 30000


#Body Style
style: """

  color: #fff
  font-family: Helvetica Neue, Arial

  .container
   margin-top:30%
   height:300px
   width:800px
   font-weight: lighter
   font-smoothing: antialiased
   text-align:center
   margin-left:30%
   text-shadow:0px 0px 20px rgba(0,0,0,0.3);

  .time
   font-size: 10em
   color:#fff
   font-weight:100
   text-align:center

  .half
   font-size:0.15em
   margin-left: -5%

  .text
   font-size: 4em
   color:#fff
   font-weight:100

  .hour
   margin-right:2%

  .min
   margin-left:-4%

"""

#Render function
render: -> """
  <div class="container">
  <div class="text">
  <span class="month"></span>
  <span class="day"></span>
  </div>
  <div class="time">
  <span class="hour"></span>:
  <span class="min"></span>
  <span class="half"></span>
  </div>
  </div>

"""

  #Update function
update: (output, domEl) ->

  #Options: (true/false)
  showAmPm = true;
  showName = true;
  fourTwenty = false; #Smoke Responsibly
  militaryTime = false; #Military Time = 24 hour time

  #Fix month
  month_arr = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  
  #Creating a new Date object
  date = new Date()
  hour = date.getHours()
  minutes = date.getMinutes()
  day = date.getDate()
  month = month_arr[date.getMonth()]

  #Quick and dirty fix for single digit minutes
  minutes = "0" + minutes if minutes < 10

  #AM/PM String logic
  if hour < 12
    half = "AM"
  else
    half = "PM"

  #0 Hour fix
  hour= 12 if hour == 0;

  #420 Hour
  if hour == 16 && minutes == 20
    blazeIt = true
  else
    blazeIt = false

  #24 - 12 Hour conversion
  hour = hour%12 if hour > 12 && !militaryTime

  #DOM manipulation
  $(domEl).find('.month').text("#{month}")
  $(domEl).find('.day').text("#{day}")
  $(domEl).find('.hour').text("#{hour}")
  $(domEl).find('.min').text("#{minutes}")
  $(domEl).find('.half').text("#{half}") if showAmPm && !militaryTime
