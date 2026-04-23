#The "FareCalc" Travel Optimizer

def calculate_fare(km, type, hour):
    rates={
        'Economy':10, 'Premium':18, 'SUV':25
    }

    if type not in rates:
        return None
    
    base_price=km*rates[type]

    surge_multiplier=1
    if 17<=hour<=20:
        surge_multiplier=1.5
    
    price=base_price*surge_multiplier

    return price

try:
    km=float(input("Enter Distance: "))
    type=input("Enter vehicle type(Economy/Premium/SUV): ")
    hour=int(input("Enter hour of day(0-23): "))

    final_price=calculate_fare(km,type,hour)

    if final_price is None:
        print("\n Service Not Available for selected vehicle type")
    else:
        print("\n=========Price Receipt==========")
        print(f"Distance Travelled : {km} km")
        print(f"Vehicle Type : {type}")
        print(f"Time of Booking : {hour}:00 hrs")

        if 17<=hour<=20:
            print("Surge Applied :        YES(1.5x)")
        else:
            print("Surge Applied :        NO")

        print(f"Final Price      :       {final_price:.2f}")

        print("==================================")

except ValueError:
    print("\n Invalid Input")





