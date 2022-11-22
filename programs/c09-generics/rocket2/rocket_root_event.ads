with Generic_Root_Event;
with Rocket_Event;
use Rocket_Event;
package Rocket_Root_Event is 
  new Generic_Root_Event(Rocket_Event.Event);