using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Player : MonoBehaviour
{
    private static Player _instance;

# region Singleton
    public static Player Instance
    {
        get
        {
            if(_instance = null)
            {
                GameObject GameObject = new GameObject("Player");
                GameObject.AddComponent<Player>();


            }
            return _instance;
        }
    }
    #endregion 

    public delegate void ChangeEnemyColor(Color color);
    public static event ChangeEnemyColor onEnemyHit;

    public Item[] items = new Item[5];
    private Properties myProperties; 
    private void Start()
    {
        items[0] = new Item(1, "Dongading", "The most powerful Dong a Ding has seen", 10, 0, 0);
        myProperties = new Properties();
        Debug.Log(myProperties.MyAge);

        
        Debug.Log(myProperties.MyAge);
        
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            if (onEnemyHit != null)
            {
                onEnemyHit(Random.ColorHSV(0f,1f,1f,1f,0.5f,1f));
            }
        }
    }
}
