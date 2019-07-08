using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class Item
{
    public int ID;
    public string name;
    public string description;
    public int Str;
    public int Agi;
    public int Stm;

    public Item(int id, string name, string desc, int str, int agi, int stm)
    {
        this.ID = id;
        this.name = name;
        this.description = desc;
        this.Str = str;
        this.Agi = agi;
        this.Stm = stm;
    }
}
