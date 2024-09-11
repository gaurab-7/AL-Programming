pageextension 50116 "Document Attachment Details" extends "Document Attachment Details"
{
    actions
    {
        addafter(Preview)
        {
            action(BulkDownload)
            {
                Caption = 'Bulk Download';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    FileManagement: Codeunit "File Management";
                    DocumentOutStream: OutStream;
                    DocumentInStream: InStream;
                    ZipOutStream: OutStream;
                    ZipInStream: InStream;
                    FullFileName: Text;
                    DataCompression: Codeunit "Data Compression";
                    ZipFileName: Text[50];
                    DocumentAttachment: Record "Document Attachment";
                begin
                    ZipFileName := 'Attachments_' + Format(CurrentDateTime) + '.zip';
                    DataCompression.CreateZipArchive();
                    DocumentAttachment.Reset();
                    CurrPage.SetSelectionFilter(DocumentAttachment);
                    if DocumentAttachment.FindSet() then
                        repeat
                            if DocumentAttachment."Document Reference ID".HasValue then begin
                                TempBlob.CreateOutStream(DocumentOutStream);
                                DocumentAttachment."Document Reference ID".ExportStream(DocumentOutStream);
                                TempBlob.CreateInStream(DocumentInStream);
                                FullFileName := DocumentAttachment."File Name" + '.' + DocumentAttachment."File Extension";
                                DataCompression.AddEntry(DocumentInStream, FullFileName);
                            end;
                        until DocumentAttachment.Next() = 0;
                    TempBlob.CreateOutStream(ZipOutStream);
                    DataCompression.SaveZipArchive(ZipOutStream);
                    TempBlob.CreateInStream(ZipInStream);
                    DownloadFromStream(ZipInStream, '', '', '', ZipFileName);
                end;
            }
        }
    }
}
