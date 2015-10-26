//: Playground - noun: a place where people can play

import UIKit
//Week9 : Bills WeBurgers
//By : Nestor (Felix) Sotres


//Main class for program (Control Class for program)
class BillsWeburgers{
    var str : String = "Week9: Bills WeBurgers\nBy: Nestor (Felix) Sotres.\n\nThis is a simple proptotype program for a gourmet burger restaurant. I am a big fan of food and I am also a fan of the TV show, Bob’s Burgers. I will be taking a few burger recipes found on http://thebobsburgerexperiment.com/  which feature some of the burgers found on the TV show."
    
    
    
    init(){
        //do nothing
    }
    
    //main function for running program
    func runProgram()-> Void{
        //intro
        printToUser(str)
        lineSeparator()
        printToUser("\nWelcome to Bill's WeBurgers Gourmet Restaurant!")
        
        //print specials
        printToUser("Here are todays specials:")
        //create instances of the burgers
        var saffronBurger = BurgerRecipes.SaffronSaffrOffBurger()
        var texasBurger = BurgerRecipes.TexasChainsawMassaCurdBurger()
        var scallionBurger = BurgerRecipes.TheSixScallionDollarManBurger()
        
        //print out name and info of each burger
        printToUser("\n\(texasBurger.name):")
        texasBurger.description()
        printToUser("Price: \(texasBurger.price)")
        printToUser("\n\(saffronBurger.name):")
        saffronBurger.description()
        printToUser("Price: \(saffronBurger.price)")
        printToUser("\n\(scallionBurger.name):")
        scallionBurger.description()
        printToUser("Price: \(scallionBurger.price)")
        lineSeparator()
        
        //present each ingredient
        saffronBurger.printIngredients()
        scallionBurger.printIngredients()
        texasBurger.printIngredients()
        lineSeparator()
        
        //ask how user would like burger cooked
        printToUser("How would you like your Burger Cooked?")
        printToUser("1.\(BurgerRecipes.BurgerCooked.rare.rawValue)")
        printToUser("2.\(BurgerRecipes.BurgerCooked.mediumWell.rawValue)")
        printToUser("3.\(BurgerRecipes.BurgerCooked.medium.rawValue)")
        printToUser("4.\(BurgerRecipes.BurgerCooked.wellDone.rawValue)")
        lineSeparator()
        
        //show that by using structs you can take advantage of the pass by value rather than pass by reference
        printToUser("\nORDER RECAP:")
        printToUser("Now were gunna pretend you ordered the Texas Massa-Curd Burger and you want a regular bun instead of Texas Toast: (Printing in a way to show advantages of using structs) ")
        
        printToUser("\nPrinting User Modified Burger: ")
        //create a new variable instance of the struct for the Texas Burger
        var userTexanBurger = texasBurger   //passed by value
        userTexanBurger.bun = "Regular Bun" //change the bun type
        userTexanBurger.printIngredients()  //print the newly changed burger
        
        printToUser("\nPrinting original Burger Recipe: ")
        texasBurger.printIngredients()      //original recipe is mantained
    }
    //used to print to console
    func printToUser(str1 : String) -> Void{
        println(str1)
    }
    
    //line separator for readability
    func lineSeparator() -> Void{
    
        printToUser("\n---------------------------\n")
    }
    
}//end class BillsWeburgers


//Class holding burger recipes and info
class BurgerRecipes{
    
    
    //enum used for the only allowable values for havinga burger cooked
    enum BurgerCooked : String{
        case rare = "Rare"
        case medium = "Medium"
        case mediumWell = "Medium-Well"
        case wellDone = "Well Done"
    }
    
    /*Structure for burger recipes. This takes advantage of the original object/structure not changing. So the original recipe never changes, since everything is passed by value not reference, but you can create an instance of the structure and change the recipe (no sauce, no veggies etc) as per the customers order. Each struct has a description function that will print out the description of the burger
    */
    struct SaffronSaffrOffBurger{
        var name: String = "Saffron Saffr-Off Burger"
        var price : String = "$7.99"
        var meat : String = "Ground Turkey"
        var bun : String = "Hamburger Bun"
        var veggies : Dictionary <String, String> = [ "veggie1": "Lettuce", "veggie2" : "Onion"]
        var fruit1 : String = "Green Apple"
        var sauce1 : String = "Fresh Honey"
        var spice : String = "Saffron"
        var cooked : BurgerCooked = BurgerCooked.medium //by default
        
        
        //brief description of sandwich
        func description() -> Void {
            println("A turkey burger stuffed with green apple and onion, and covered in saffron infused honey.")
        }
        //print ingredients of burger
        func printIngredients() -> Void {
            println("\nIngredients for the \(name):")
            println("Patty: \(meat)")
            println("Bun: \(bun)")
            println("Fixings: " + veggies["veggie1"]! + ", \(fruit1), \(spice)")
            println("Sauce: \(sauce1)")
            
        }
    }
    
    struct TheSixScallionDollarManBurger{
        var name : String = "The Six Scallion Dollar Man Burger"
        var price : String = "8.99"
        var meat : String = "Beef"
        var bun : String = "Hamburger Bun"
        var veggies : Dictionary <String, String> = ["veggie1" : "Bok Choy", "veggie2" : "Scallions", "veggie3" : "Ginger"]
        var sauces : Dictionary <String, String> = ["sauce1" : "Soy Sauce", "sauce2" : "Honey"]
        var cooked : BurgerCooked = BurgerCooked.medium //by default
        
        //brief description of sandwich
        func description()-> Void {
            println("A ginger stuffed beef burger on a bed of steamed bok-choy and slathered in tamari soaked scallions.")
        }
        
        //print ingredients of burger
        func printIngredients() -> Void{
            println("\nIngredients for the \(name):")
            println("Patty: \(meat)")
            println("Bun: \(bun)")
            println("Fixings: " + veggies["veggie1"]! + ", " + veggies["veggie2"]! + ", " + veggies["veggie3"]!)
            println("Sauce:" + sauces["sauce1"]! + ", " + sauces["sauce2"]!)
        }
        
    }
    
    struct TexasChainsawMassaCurdBurger{
        var name : String = "Texas Chainsaw Massa-Curd Burger"
        var price : String = "$8.99"
        var meat : String = "Beef"
        var bun : String = "Texas Toast"
        var veggies : Dictionary <String, String> = ["veggie1" : "Habanero", "veggie2" : "Lettuce"]
        var cheese1 : String = "Cheese Curds"
        var sauce1 : String = "Tomato-Ginger Sauce"
        var cooked : BurgerCooked = BurgerCooked.medium //by default
        
        //brief description of sandwich
        func description()-> Void{
            println("A habanero stuff patty slathered in melty cheesecurds and a homemade tomato-ginger ketchup.")
        }
        //print ingredients of burger
        func printIngredients() -> Void{
            println("\nIngredients for the \(name):")
            println("Patty: \(meat)")
            println("Bun: \(bun)")
            println("Fixings: " + veggies["veggie1"]! + ", " + veggies["veggie2"]! + ", \(cheese1) \(sauce1)")
        }
    }
    
    
}//end class BurgerRecipes


var run = BillsWeburgers()

run.runProgram()




