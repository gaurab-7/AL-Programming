page 50132 "Purch Req. Subform NEP"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = filter(Requisition));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field(Type; Rec.Type)
                {
                    ApplicationArea = Advanced;
                    ToolTip = 'Specifies the line type.';

                    trigger OnValidate()
                    begin
                        NoOnAfterValidate();

                        UpdateEditableOnRow();
                        UpdateTypeText();
                        DeltaUpdateTotals();
                    end;
                }
                field(FilteredTypeField; TypeAsText)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Type';
                    Editable = CurrPageIsEditable;
                    LookupPageID = "Option Lookup List";
                    TableRelation = "Option Lookup Buffer"."Option Caption" where("Lookup Type" = const(Purchases));
                    ToolTip = 'Specifies the type of entity that will be posted for this purchase line, such as Item or G/L Account.';
                    Visible = IsFoundation;

                    trigger OnValidate()
                    begin
                        if TempOptionLookupBuffer.AutoCompleteLookup(TypeAsText, TempOptionLookupBuffer."Lookup Type"::Purchases) then
                            Rec.Validate(Type, TempOptionLookupBuffer.Id);
                        // if TempOptionLookupBuffer.AutoCompleteOption(TypeAsText, TempOptionLookupBuffer."Lookup Type"::Purchases) then
                        //     Validate(Type, TempOptionLookupBuffer.ID);
                        TempOptionLookupBuffer.ValidateOption(TypeAsText);
                        UpdateEditableOnRow();
                        UpdateTypeText();
                        DeltaUpdateTotals();
                    end;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Suite;
                    ShowMandatory = not IsCommentLine;
                    ToolTip = 'Specifies the number of a general ledger account, item, additional cost, or fixed asset, depending on what you selected in the Type field.';

                    trigger OnValidate()
                    begin
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate();

                        UpdateTypeText();
                        DeltaUpdateTotals();

                        CurrPage.Update();
                    end;
                }
                field("Cross-Reference No."; Rec."Item Reference No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the cross-referenced item number. If you enter a cross reference between yours and your vendor''s or customer''s item number, then this number will override the standard item number when you enter the cross-reference number on a sales or purchase document.';
                    Visible = false;
                    ObsoleteReason = 'Cross-Reference replaced by Item Reference feature.';
                    ObsoleteState = Pending;
                    ObsoleteTag = '17.0';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        NoOnAfterValidate();
                        OnCrossReferenceNoOnLookup(Rec);
                    end;

                    trigger OnValidate()
                    begin
                        NoOnAfterValidate();
                        DeltaUpdateTotals();
                    end;
                }
                field("Item Reference No."; Rec."Item Reference No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the cross-referenced item number.';
                    Visible = ItemReferenceVisible;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ItemReferenceMgt: Codeunit "Item Reference Management";
                    begin
                        ItemReferenceMgt.PurchaseReferenceNoLookup(Rec);
                        NoOnAfterValidate();
                        OnItemReferenceNoOnLookup(Rec);
                    end;

                    trigger OnValidate()
                    begin
                        NoOnAfterValidate();
                        DeltaUpdateTotals();
                    end;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field(Nonstock; Rec.Nonstock)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies that this item is a catalog item.';
                    Visible = false;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies a description of the entry of the product to be purchased. To add a non-transactional text line, fill in the Description field only.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                        NoOnAfterValidate();
                    end;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    Editable = not IsBlankNumber;
                    Enabled = not IsBlankNumber;
                    ToolTip = 'Specifies a code for the location where you want to receive the items.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Suite;
                    BlankZero = true;
                    Editable = not IsBlankNumber;
                    Enabled = not IsBlankNumber;
                    ShowMandatory = (not IsCommentLine) AND (Rec."No." <> '');
                    ToolTip = 'Specifies the number of units of the item specified on the line.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Suite;
                    Editable = UnitofMeasureCodeIsChangeable;
                    Enabled = UnitofMeasureCodeIsChangeable;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the unit of measure.';
                    Visible = false;
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                    ApplicationArea = Suite;
                    BlankZero = true;
                    Editable = not IsBlankNumber;
                    Enabled = not IsBlankNumber;
                    ShowMandatory = (not IsCommentLine) AND (Rec."No." <> '');
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Indirect Cost %"; Rec."Indirect Cost %")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the percentage of the item''s last purchase cost that includes indirect costs, such as freight that is associated with the purchase of the item.';
                    Visible = false;
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the cost, in LCY, of one unit of the item or resource on the line.';
                    Visible = false;
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    ApplicationArea = Suite;
                    BlankZero = true;
                    ToolTip = 'Specifies the price, in LCY, of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                    Visible = false;
                }
                field("Tax Liable"; Rec."Tax Liable")
                {
                    ApplicationArea = SalesTax;
                    Editable = false;
                    ToolTip = 'Specifies if this vendor charges you sales tax for purchases.';
                    Visible = false;
                }
                field("Tax Area Code"; Rec."Tax Area Code")
                {
                    ApplicationArea = SalesTax;
                    ToolTip = 'Specifies the tax area that is used to calculate and post sales tax.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Tax Group Code"; Rec."Tax Group Code")
                {
                    ApplicationArea = SalesTax;
                    ShowMandatory = Rec."Tax Area Code" <> '';
                    ToolTip = 'Specifies the tax group that is used to calculate and post sales tax.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Use Tax"; Rec."Use Tax")
                {
                    ApplicationArea = SalesTax;
                    ToolTip = 'Specifies a U.S. sales tax that is paid on items purchased by a company that are used by the company, instead of being sold to a customer.';
                    Visible = false;
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = Suite;
                    BlankZero = true;
                    Editable = not IsBlankNumber;
                    Enabled = not IsBlankNumber;
                    ToolTip = 'Specifies the discount percentage that is granted for the item on the line.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Suite;
                    BlankZero = true;
                    Editable = not IsBlankNumber;
                    Enabled = not IsBlankNumber;
                    ToolTip = 'Specifies the net amount, excluding any invoice discount amount, that must be paid for products on the line.';

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the discount amount that is granted for the item on the line.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Allow Invoice Disc."; Rec."Allow Invoice Disc.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies if the invoice line is included when the invoice discount is calculated.';
                    Visible = false;

                    trigger OnValidate()
                    begin
                        DeltaUpdateTotals();
                    end;
                }
                field("Allow Item Charge Assignment"; Rec."Allow Item Charge Assignment")
                {
                    ApplicationArea = ItemCharges;
                    ToolTip = 'Specifies that you can assign item charges to this line.';
                    Visible = false;
                }
                field("Qty. to Assign"; Rec."Qty. to Assign")
                {
                    ApplicationArea = ItemCharges;
                    StyleExpr = ItemChargeStyleExpression;
                    ToolTip = 'Specifies how many units of the item charge will be assigned to the line.';

                    trigger OnDrillDown()
                    begin
                        CurrPage.SaveRecord();
                        Rec.ShowItemChargeAssgnt();
                        UpdateForm(false);
                    end;
                }
                field("Qty. Assigned"; Rec."Qty. Assigned")
                {
                    ApplicationArea = ItemCharges;
                    BlankZero = true;
                    ToolTip = 'Specifies how much of the item charge that has been assigned.';

                    trigger OnDrillDown()
                    begin
                        CurrPage.SaveRecord();
                        Rec.ShowItemChargeAssgnt();
                        UpdateForm(false);
                    end;
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the related production order.';
                    Visible = false;
                }
                field("Blanket Order No."; Rec."Blanket Order No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the blanket order that the record originates from.';
                    Visible = false;
                }
                field("Blanket Order Line No."; Rec."Blanket Order Line No.")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the blanket order line that the record originates from.';
                    Visible = false;
                }
                field("Appl.-to Item Entry"; Rec."Appl.-to Item Entry")
                {
                    ApplicationArea = Suite;
                    ToolTip = 'Specifies the number of the item ledger entry that the document or journal line is applied to.';
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = DimVisible1;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = DimVisible2;
                }
                field(ShortcutDimCode3; ShortcutDimCode[3])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = DimVisible3;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[3] field.';

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);

                        OnAfterValidateShortcutDimCode(Rec, ShortcutDimCode, 3);
                    end;
                }
                field(ShortcutDimCode4; ShortcutDimCode[4])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = DimVisible4;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[4] field.';

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);

                        OnAfterValidateShortcutDimCode(Rec, ShortcutDimCode, 4);
                    end;
                }
                field(ShortcutDimCode5; ShortcutDimCode[5])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = DimVisible5;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[5] field.';

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);

                        OnAfterValidateShortcutDimCode(Rec, ShortcutDimCode, 5);
                    end;
                }
                field(ShortcutDimCode6; ShortcutDimCode[6])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = DimVisible6;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[6] field.';

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);

                        OnAfterValidateShortcutDimCode(Rec, ShortcutDimCode, 6);
                    end;
                }
                field(ShortcutDimCode7; ShortcutDimCode[7])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = DimVisible7;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[7] field.';

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);

                        OnAfterValidateShortcutDimCode(Rec, ShortcutDimCode, 7);
                    end;
                }
                field(ShortcutDimCode8; ShortcutDimCode[8])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = DimVisible8;
                    ToolTip = 'Specifies the value of the ShortcutDimCode[8] field.';

                    trigger OnValidate()
                    begin
                        Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);

                        OnAfterValidateShortcutDimCode(Rec, ShortcutDimCode, 8);
                    end;
                }
            }
            group(Control40)
            {
                ShowCaption = false;

                group(Control31)
                {
                    ShowCaption = false;

                    field(AmountBeforeDiscount; TotalPurchaseLine."Line Amount")
                    {
                        ApplicationArea = Suite;
                        AutoFormatExpression = Rec."Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalLineAmountWithVATAndCurrencyCaption(Currency.Code, TotalPurchaseHeader."Prices Including VAT");
                        Caption = 'Subtotal Excl. VAT';
                        Editable = false;
                        ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document.';
                    }
                    field("Invoice Discount Amount"; InvoiceDiscountAmount)
                    {
                        ApplicationArea = Suite;
                        AutoFormatExpression = Rec."Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetInvoiceDiscAmountWithVATAndCurrencyCaption(Rec.FieldCaption("Inv. Discount Amount"), Currency.Code);
                        Caption = 'Invoice Discount Amount';
                        Editable = InvDiscAmountEditable;
                        ToolTip = 'Specifies the amount that is calculated and shown in the Invoice Discount Amount field. The invoice discount amount is deducted from the value shown in the Total Amount Incl. VAT field.';

                        trigger OnValidate()
                        begin
                            ValidateInvoiceDiscountAmount();
                            DocumentTotals.PurchaseDocTotalsNotUpToDate();
                        end;
                    }
                    field("Invoice Disc. Pct."; InvoiceDiscountPct)
                    {
                        ApplicationArea = Suite;
                        Caption = 'Invoice Discount %';
                        DecimalPlaces = 0 : 3;
                        Editable = InvDiscAmountEditable;
                        ToolTip = 'Specifies a discount percentage that is granted if criteria that you have set up for the customer are met. The calculated discount amount is inserted in the Invoice Discount Amount field, but you can change it manually.';

                        trigger OnValidate()
                        begin
                            AmountWithDiscountAllowed := DocumentTotals.CalcTotalPurchAmountOnlyDiscountAllowed(Rec);
                            InvoiceDiscountAmount := Round(AmountWithDiscountAllowed * InvoiceDiscountPct / 100, Currency."Amount Rounding Precision");
                            ValidateInvoiceDiscountAmount();
                            DocumentTotals.PurchaseDocTotalsNotUpToDate();
                        end;
                    }
                }
                group(Control17)
                {
                    ShowCaption = false;

                    field("Total Amount Excl. VAT"; TotalPurchaseLine.Amount)
                    {
                        ApplicationArea = Suite;
                        AutoFormatExpression = Rec."Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalExclVATCaption(Currency.Code);
                        Caption = 'Total Amount Excl. VAT';
                        DrillDown = false;
                        Editable = false;
                        ToolTip = 'Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field.';
                    }
                    field("Total VAT Amount"; VATAmount)
                    {
                        ApplicationArea = Suite;
                        AutoFormatExpression = Rec."Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalVATCaption(Currency.Code);
                        Caption = 'Total VAT';
                        Editable = false;
                        ToolTip = 'Specifies the sum of VAT amounts on all lines in the document.';
                    }
                    field("Total Amount Incl. VAT"; TotalPurchaseLine."Amount Including VAT")
                    {
                        ApplicationArea = Suite;
                        AutoFormatExpression = Rec."Currency Code";
                        AutoFormatType = 1;
                        CaptionClass = DocumentTotals.GetTotalInclVATCaption(Currency.Code);
                        Caption = 'Total Amount Incl. VAT';
                        Editable = false;
                        ToolTip = 'Specifies the sum of the value in the Line Amount Incl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field.';
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SelectMultiItems)
            {
                AccessByPermission = TableData Item = R;
                ApplicationArea = Basic, Suite;
                Caption = 'Select items';
                Ellipsis = true;
                Image = NewItem;
                ToolTip = 'Add two or more items from the full list of your inventory items.';

                trigger OnAction()
                begin
                    Rec.SelectMultipleItems();
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";

                action("E&xplode BOM")
                {
                    AccessByPermission = TableData "BOM Component" = R;
                    ApplicationArea = Suite;
                    Caption = 'E&xplode BOM';
                    Image = ExplodeBOM;
                    Enabled = Rec.Type = Rec.Type::Item;
                    ToolTip = 'Add a line for each component on the bill of materials for the selected item. For example, this is useful for selling the parent item as a kit. CAUTION: The line for the parent item will be deleted and only its description will display. To undo this action, delete the component lines and add a line for the parent item again. This action is available only for lines that contain an item.';

                    trigger OnAction()
                    begin
                        ExplodeBOM();
                    end;
                }
                action("Insert &Ext. Texts")
                {
                    AccessByPermission = TableData "Extended Text Header" = R;
                    ApplicationArea = Suite;
                    Caption = 'Insert &Ext. Texts';
                    Image = Text;
                    ToolTip = 'Insert the extended item description that is set up for the item that is being processed on the line.';

                    trigger OnAction()
                    begin
                        InsertExtendedText(true);
                    end;
                }
            }
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;

                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;
                    Enabled = Rec.Type = Rec.Type::Item;

                    action("Event")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Event';
                        Image = "Event";
                        ToolTip = 'View how the actual and the projected available balance of an item will develop over time according to supply and demand events.';

                        trigger OnAction()
                        begin
                            ItemAvailabilityFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailabilityFormsMgt.ByEvent())
                        end;
                    }
                    action(Period)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Period';
                        Image = Period;
                        ToolTip = 'View the projected quantity of the item over time according to time periods, such as day, week, or month.';

                        trigger OnAction()
                        begin
                            ItemAvailabilityFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailabilityFormsMgt.ByPeriod())
                        end;
                    }
                    action(Variant)
                    {
                        ApplicationArea = Planning;
                        Caption = 'Variant';
                        Image = ItemVariant;
                        ToolTip = 'View or edit the item''s variants. Instead of setting up each color of an item as a separate item, you can set up the various colors as variants of the item.';

                        trigger OnAction()
                        begin
                            ItemAvailabilityFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailabilityFormsMgt.ByVariant())
                        end;
                    }
                    action(Location)
                    {
                        AccessByPermission = TableData Location = R;
                        ApplicationArea = Location;
                        Caption = 'Location';
                        Image = Warehouse;
                        ToolTip = 'View the actual and projected quantity of the item per location.';

                        trigger OnAction()
                        begin
                            ItemAvailabilityFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailabilityFormsMgt.ByLocation())
                        end;
                    }
                    action("BOM Level")
                    {
                        AccessByPermission = TableData "BOM Buffer" = R;
                        ApplicationArea = Assembly;
                        Caption = 'BOM Level';
                        Image = BOMLevel;
                        ToolTip = 'View availability figures for items on bills of materials that show how many units of a parent item you can make based on the availability of child items.';

                        trigger OnAction()
                        begin
                            ItemAvailabilityFormsMgt.ShowItemAvailFromPurchLine(Rec, ItemAvailabilityFormsMgt.ByBOM())
                        end;
                    }
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Suite;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Alt+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions();
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';

                    trigger OnAction()
                    begin
                        Rec.ShowLineComments();
                    end;
                }
                action(ItemChargeAssignment)
                {
                    AccessByPermission = TableData "Item Charge" = R;
                    ApplicationArea = ItemCharges;
                    Caption = 'Item Charge &Assignment';
                    Image = ItemCosts;
                    Enabled = Rec.Type = Rec.Type::"Charge (Item)";
                    ToolTip = 'Record additional direct costs, for example for freight. This action is available only for Charge (Item) line types.';

                    trigger OnAction()
                    begin
                        Rec.ShowItemChargeAssgnt();
                        SetItemChargeFieldsStyle();
                    end;
                }
                action("Item Tracking Lines")
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';
                    Enabled = Rec.Type = Rec.Type::Item;
                    ToolTip = 'View or edit serial and lot numbers for the selected item. This action is available only for lines that contain an item.';

                    trigger OnAction()
                    begin
                        Rec.OpenItemTrackingLines();
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }
            }
            group("Page")
            {
                Caption = 'Page';

                action(EditInExcel)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Edit in Excel';
                    Image = Excel;
                    Visible = IsSaaSExcelAddinEnabled;
                    ToolTip = 'Send the data in the sub page to an Excel file for analysis or editing';
                    AccessByPermission = System "Allow Action Export To Excel" = X;

                    trigger OnAction()
                    var
                        ODataUtility: Codeunit ODataUtility;
                        DocNoEqTxt: Label 'Document_No eq ''%1''', Locked = true;
                    begin
                        ODataUtility.EditWorksheetInExcel('Purchase_QuotePurchLines', CurrPage.ObjectId(false), StrSubstNo(DocNoEqTxt, Rec."Document No."));
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        GetTotalsPurchaseHeader();
        CalculateTotals();
        UpdateEditableOnRow();
        UpdateTypeText();
        SetItemChargeFieldsStyle();
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
        UpdateTypeText();
        SetItemChargeFieldsStyle();
    end;

    trigger OnDeleteRecord(): Boolean
    var
        PurchLineReserve: Codeunit "Purch. Line-Reserve";
    begin
        if (Rec.Quantity <> 0) and Rec.ItemExists(Rec."No.") then begin
            Commit();
            if not PurchLineReserve.DeleteLineConfirm(Rec) then
                exit(false);
            PurchLineReserve.DeleteLine(Rec);
        end;
        DocumentTotals.PurchaseDocTotalsNotUpToDate();
    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        DocumentTotals.PurchaseCheckAndClearTotals(Rec, xRec, TotalPurchaseLine, VATAmount, InvoiceDiscountAmount, InvoiceDiscountPct);
        exit(Rec.Find(Which));
    end;

    trigger OnInit()
    var
        ApplicationAreaMgmtFacade2: Codeunit "Application Area Mgmt. Facade";
    begin
        PurchasesPayablesSetup.Get();
        TempOptionLookupBuffer.FillLookupBuffer(TempOptionLookupBuffer."Lookup Type"::Purchases);
        IsFoundation := ApplicationAreaMgmtFacade2.IsFoundationEnabled();
        Currency.InitRoundingPrecision();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        DocumentTotals.PurchaseCheckIfDocumentChanged(Rec, xRec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.InitType();
        SetDefaultType();

        Clear(ShortcutDimCode);
        UpdateTypeText();
    end;

    trigger OnOpenPage()
    var
        ServerSetting: Codeunit "Server Setting";
    begin
        IsSaaSExcelAddinEnabled := ServerSetting.GetIsSaasExcelAddinEnabled();
        SuppressTotals := CurrentClientType() = ClientType::ODataV4;

        SetDimensionsVisibility();
        SetItemReferenceVisibility();
    end;

    var
        TotalPurchaseHeader: Record "Purchase Header";
        TotalPurchaseLine: Record "Purchase Line";
        Currency: Record Currency;
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        TempOptionLookupBuffer: Record "Option Lookup Buffer" temporary;
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ItemAvailabilityFormsMgt: Codeunit "Item Availability Forms Mgt";
        PurchCalcDiscByType: Codeunit "Purch - Calc Disc. By Type";
        DocumentTotals: Codeunit "Document Totals";
        VATAmount: Decimal;
        InvoiceDiscountAmount: Decimal;
        InvoiceDiscountPct: Decimal;
        AmountWithDiscountAllowed: Decimal;
        TypeAsText: Text[30];
        ItemChargeStyleExpression: Text;
        InvDiscAmountEditable: Boolean;
        IsFoundation: Boolean;
        IsSaaSExcelAddinEnabled: Boolean;
        UnitofMeasureCodeIsChangeable: Boolean;
        CurrPageIsEditable: Boolean;
        SuppressTotals: Boolean;
        [InDataSet]
        ItemReferenceVisible: Boolean;
        CannotUseBOMErr: Label 'You cannot use the Explode BOM function because a prepayment of the related purchase order has been invoiced.';
        UpdateInvDiscountQst: Label 'One or more lines have been invoiced. The discount distributed to invoiced lines will not be taken into account.\\Do you want to update the invoice discount?';

    protected var
        ShortcutDimCode: array[8] of Code[20];
        DimVisible1: Boolean;
        DimVisible2: Boolean;
        DimVisible3: Boolean;
        DimVisible4: Boolean;
        DimVisible5: Boolean;
        DimVisible6: Boolean;
        DimVisible7: Boolean;
        DimVisible8: Boolean;
        IsBlankNumber: Boolean;
        IsCommentLine: Boolean;

    procedure ApproveCalcInvDisc()
    begin
        Codeunit.Run(Codeunit::"Purch.-Disc. (Yes/No)", Rec);
        DocumentTotals.PurchaseDocTotalsNotUpToDate();
    end;

    procedure InsertExtendedText(Unconditionally: Boolean)
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInsertExtendedText(Rec, IsHandled);
        if IsHandled then
            exit;

        if TransferExtendedText.PurchCheckIfAnyExtText(Rec, Unconditionally) then begin
            CurrPage.SaveRecord();
            TransferExtendedText.InsertPurchExtText(Rec);
        end;
        if TransferExtendedText.MakeUpdate() then
            UpdateForm(true);
    end;

    procedure UpdateForm(SetSaveRecord: Boolean)
    begin
        CurrPage.Update(SetSaveRecord);
    end;

    procedure NoOnAfterValidate()
    begin
        UpdateEditableOnRow();
        InsertExtendedText(false);
        if (Rec.Type = Rec.Type::"Charge (Item)") and (Rec."No." <> xRec."No.") and
           (xRec."No." <> '')
        then
            CurrPage.SaveRecord();

        OnAfterNoOnAfterValidate(Rec, xRec);
    end;

    procedure RedistributeTotalsOnAfterValidate()
    begin
        if SuppressTotals then
            exit;

        CurrPage.SaveRecord();

        DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec, VATAmount, TotalPurchaseLine);
        CurrPage.Update(false);
    end;

    procedure DeltaUpdateTotals()
    begin
        if SuppressTotals then
            exit;

        DocumentTotals.PurchaseDeltaUpdateTotals(Rec, xRec, TotalPurchaseLine, VATAmount, InvoiceDiscountAmount, InvoiceDiscountPct);
        CheckSendLineInvoiceDiscountResetNotification();
    end;

    procedure UpdateEditableOnRow()
    begin
        IsCommentLine := Rec.Type = Rec.Type::" ";
        IsBlankNumber := IsCommentLine;
        UnitofMeasureCodeIsChangeable := not IsCommentLine;

        CurrPageIsEditable := CurrPage.Editable;
        InvDiscAmountEditable := CurrPageIsEditable and not PurchasesPayablesSetup."Calc. Inv. Discount";

        OnAfterUpdateEditableOnRow(Rec, IsCommentLine, IsBlankNumber);
    end;

    procedure UpdateTypeText()
    var
        LocRecordRef: RecordRef;
    begin
        if not IsFoundation then
            exit;

        OnBeforeUpdateTypeText(Rec);

        LocRecordRef.GetTable(Rec);
        TypeAsText := TempOptionLookupBuffer.FormatOption(LocRecordRef.Field(Rec.FieldNo(Type)));
    end;

    local procedure ValidateInvoiceDiscountAmount()
    var
        PurchaseHeader: Record "Purchase Header";
        ConfirmManagement: Codeunit "Confirm Management";
    begin
        if SuppressTotals then
            exit;

        PurchaseHeader.Get(Rec."Document Type", Rec."Document No.");
        if PurchaseHeader.InvoicedLineExists() then
            if not ConfirmManagement.GetResponseOrDefault(UpdateInvDiscountQst, true) then
                exit;

        DocumentTotals.PurchaseDocTotalsNotUpToDate();
        PurchCalcDiscByType.ApplyInvDiscBasedOnAmt(InvoiceDiscountAmount, PurchaseHeader);
        CurrPage.Update(false);
    end;

    local procedure ExplodeBOM()
    begin
        if Rec."Prepmt. Amt. Inv." <> 0 then
            Error(CannotUseBOMErr);

        Codeunit.Run(Codeunit::"Purch.-Explode BOM", Rec);
        DocumentTotals.PurchaseDocTotalsNotUpToDate();
    end;

    local procedure GetTotalsPurchaseHeader()
    begin
        DocumentTotals.GetTotalPurchaseHeaderAndCurrency(Rec, TotalPurchaseHeader, Currency);
    end;

    local procedure CalculateTotals()
    begin
        if SuppressTotals then
            exit;

        DocumentTotals.PurchaseCheckIfDocumentChanged(Rec, xRec);
        DocumentTotals.CalculatePurchaseSubPageTotals(
          TotalPurchaseHeader, TotalPurchaseLine, VATAmount, InvoiceDiscountAmount, InvoiceDiscountPct);
        DocumentTotals.RefreshPurchaseLine(Rec);
    end;

    local procedure CheckSendLineInvoiceDiscountResetNotification()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeCheckSendLineInvoiceDiscountResetNotification(Rec, IsHandled);
        if IsHandled then
            exit;

        if Rec."Line Amount" <> xRec."Line Amount" then
            Rec.SendLineInvoiceDiscountResetNotification();
    end;

    local procedure SetItemChargeFieldsStyle()
    begin
        ItemChargeStyleExpression := '';
        if Rec.AssignedItemCharge() and (Rec."Qty. Assigned" <> Rec.Quantity) then
            ItemChargeStyleExpression := 'Unfavorable';
    end;

    local procedure SetDimensionsVisibility()
    var
        DimensionManagement: Codeunit DimensionManagement;
    begin
        DimVisible1 := false;
        DimVisible2 := false;
        DimVisible3 := false;
        DimVisible4 := false;
        DimVisible5 := false;
        DimVisible6 := false;
        DimVisible7 := false;
        DimVisible8 := false;

        DimensionManagement.UseShortcutDims(
          DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);

        Clear(DimensionManagement);
    end;

    local procedure SetItemReferenceVisibility()
    var
        ItemReference: Record "Item Reference";
    begin
        ItemReferenceVisible := not ItemReference.IsEmpty();
    end;

    local procedure SetDefaultType()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeSetDefaultType(Rec, xRec, IsHandled);
        if not IsHandled then // Set default type Item
            if ApplicationAreaMgmtFacade.IsFoundationEnabled() then
                if xRec."Document No." = '' then
                    Rec.Type := Rec.Type::Item;
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterNoOnAfterValidate(var PurchaseLine: Record "Purchase Line"; var xPurchaseLine: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateEditableOnRow(PurchaseLine: Record "Purchase Line"; var IsCommentLine: Boolean; var IsBlankNumber: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateShortcutDimCode(var PurchaseLine: Record "Purchase Line"; var ShortcutDimCode: array[8] of Code[20]; DimIndex: Integer)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertExtendedText(var PurchaseLine: Record "Purchase Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckSendLineInvoiceDiscountResetNotification(var PurchaseLine: Record "Purchase Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSetDefaultType(var PurchaseLine: Record "Purchase Line"; var xPurchaseLine: Record "Purchase Line"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdateTypeText(var PurchaseLine: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnCrossReferenceNoOnLookup(var PurchaseLine: Record "Purchase Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnItemReferenceNoOnLookup(var PurchaseLine: Record "Purchase Line")
    begin
    end;
}