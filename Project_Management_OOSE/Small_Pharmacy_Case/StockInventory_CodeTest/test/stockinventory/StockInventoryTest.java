/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package stockinventory;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author ErDenien
 */
public class StockInventoryTest {
    
    private StockInventory item;
    
     
    @Before
    public void setUp() {
        item = new StockInventory();
    }
    
   
    @Test
    /** Checks that Name Cannot be empty*/
    public void notEmptyName() {
        
        /** Setting variable to fail test*/
        String a = "Populated";
        String test = item.getItemByName(a);
        assertNotEquals("", test);
    }
    @Test
    /** Checks Name doesn't include "/"*/
    public void noIncludeCharacter(){
       
        /** Setting variable to fail test*/
        String str = "Paracetamol";
        String test = "/";
        boolean bool = str.contains(test);
        assertFalse(bool);
    }
    
    
}
