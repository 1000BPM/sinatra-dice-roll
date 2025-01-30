require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
"
  <h1>Dice roll, ya filthy animal.</h1>
  <p></p>
<ul>
  
  <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
  <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
  <li><a href=\"/dice/2/10\">Roll two 10-sided die</a></li>
  <li><a href=\"/dice/5/4\">Roll five 4-sided die</a></li>
 
</ul>
"
end

get ("/giraffe") do
  "I hope this works"

end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h2>2d6</h2>
   <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h2>2d10</h2>
   <p>#{outcome}</p>"
end

get ("/dice/1/20") do
  first_die = rand(1..20)
  
  outcome = "You rolled a #{first_die}."

  "<h1>1d10</h1>
  <p>#{outcome}</p>"
end

get ("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)

  sum = first_die + second_die + third_die + fourth_die + fifth_die

  outcome = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, a #{fourth_die}, and a #{fifth_die} for a total of #{sum}."

  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end
