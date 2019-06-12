using UnityEngine;
using UnityEngine.UI;

public class InventoryUI : MonoBehaviour
{
    
    public Transform itemsParent;
    public GameObject inventoryUI;


    Inventory inventory;

    InventorySlot[] slots;

    // Start is called before the first frame update
    void Start()
    {
        inventory = Inventory.instance;
        inventory.onItemChangedCallback += UpdateUI;

        slots = itemsParent.GetComponentsInChildren<InventorySlot>();
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetButtonDown("Inventory"))
        {
            inventoryUI.SetActive(!inventoryUI.activeSelf);
        }
    }

    void UpdateUI ()
    {
        Debug.Log("UPDATING UI");
        Debug.Log(inventory.items.Count);
        Debug.Log(slots.Length);

        for (int i = 0; i < slots.Length; i++)
        {
            if (i < inventory.items.Count)
            {
                slots[i].AddItem(inventory.items[i]);
                Debug.Log("Iterating through inventory " + i);

            }
            else
            {
                slots[i].ClearSlot();
                Debug.Log("Clearing slots " + i);
            }
        }
    }
}
