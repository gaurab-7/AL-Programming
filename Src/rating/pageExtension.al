// pageextension 50117 "Item List Ext" extends "Item List"
// {
//     actions
//     {
//         addlast(Processing)
//         {
//             action("Add Review")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Add Review';
//                 Image = New;

//                 trigger OnAction()
//                 var
//                     ReviewCard: Page "Product Review Card";
//                     Item : Record Item;
//                 begin
//                     ReviewCard.Insert();
//                     ReviewCard.SetRecFilter(Item."No.", Item.Description);
//                     ReviewCard.Run();
//                 end;
//             }
//         }
//     }
// }
