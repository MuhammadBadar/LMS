export interface Invoice {
  clientname?: string;
  clientpo?: string;
  percent?: string;
  value?: string;
  charges?: string;
  // name?:string,
  date?:string;
  id?: string;
  item?: InvoiceItem[];
  items?: InvoiceItems[];
  myitem?:myInvoiceItem[];
  sitem?:sInvoiceItem[];
}
export interface myInvoiceItem{
    SKU;
		Qty;
		Currency;
		UnitPrice;
		UOM;
    HeadGroup;
    HeadType;
    HeadCategory;
     HeadName;
     Name ;
     LineTotal
	
}
export interface sInvoiceItem{
  InvoiceStageId;
Name;
Qty;
UOM;
Currency;
UnitPrice;
LineTotal;
   
 }

export interface InvoiceItems {
   ItemName: string;
  InvoiceItemId: number;
  InvoiceStageId: number;
  ItemGroupId: number;
  ItemType: string;
  ItemCategory:string ;
  SKU: string;
  Qty: number;
  UOM: null;
  Currency: number;
  UnitPrice: number;
  LineTotal: null;
}

export interface InvoiceItem {
  ItemName: string;
  InvoiceItemId: number;
  InvoiceStageId: number;
  ItemGroupId: number;
  ItemType: string;
  ItemCategory:string ;
  SKU: string;
  Qty: number;
  UOM: null;
  Currency: number;
  UnitPrice: number;
  LineTotal: null;
  id? ;
		ItemTypeId;
		ItemCategoryId;
		InventoryItemId;
		itemSKU;
    HeadGroup;
    HeadType;
    HeadCategory;
     HeadName;
     
	
		
		
	
 

}
