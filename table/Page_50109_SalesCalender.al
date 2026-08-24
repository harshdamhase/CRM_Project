page 50109 "Sales Calendar"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Activity Table";
    Caption = 'Sales Calendar';

    layout
    {
        area(Content)
        {
            group(CalendarFilter)
            {
                Caption = 'Calendar';

                field(SelectedDate; SelectedDate)
                {
                    ApplicationArea = All;
                    Caption = 'Calendar Date';

                    trigger OnValidate()
                    begin
                        SetDateFilter();
                    end;
                }
            }

            repeater(Activities)
            {
                field("Activity Date"; Rec."Activity Date")
                {
                    ApplicationArea = All;
                }

                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                }

                field("End time"; Rec."End time")
                {
                    ApplicationArea = All;
                }

                field("Activity Type"; Rec."Activity Type")
                {
                    ApplicationArea = All;
                }

                field(Subject; Rec.Subject)
                {
                    ApplicationArea = All;
                }

                field("Oppurtunity No"; Rec."Oppurtunity No")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }

        area(Factboxes)
        {
        }
    }

    actions
    {
        area(Processing)
        {
            action(PreviousDay)
            {
                ApplicationArea = All;
                Caption = 'Previous Day';
                Image = PreviousRecord;

                trigger OnAction()
                begin
                    SelectedDate := CalcDate('<-1D>', SelectedDate);
                    SetDateFilter();
                end;
            }

            action(Today)
            {
                ApplicationArea = All;
                Caption = 'Today';
                Image = Today;

                trigger OnAction()
                begin
                    SelectedDate := WorkDate();
                    SetDateFilter();
                end;
            }

            action(NextDay)
            {
                ApplicationArea = All;
                Caption = 'Next Day';
                Image = NextRecord;

                trigger OnAction()
                begin
                    SelectedDate := CalcDate('<1D>', SelectedDate);
                    SetDateFilter();
                end;
            }

            action(ShowAllActivities)
            {
                ApplicationArea = All;
                Caption = 'Show All Activities';
                Image = ClearFilter;

                trigger OnAction()
                begin
                    Rec.Reset();
                    CurrPage.Update(false);
                end;
            }
        }

        area(Navigation)
        {
            action(OpenActivity)
            {
                ApplicationArea = All;
                Caption = 'Open Activity';
                Image = Edit;

                trigger OnAction()
                begin
                    Page.Run(Page::"Activity Card Page", Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        SelectedDate := WorkDate();
        SetDateFilter();
    end;

    var
        SelectedDate: Date;

    local procedure SetDateFilter()
    begin
        Rec.Reset();
        Rec.SetRange("Activity Date", SelectedDate);
        CurrPage.Update(false);
    end;
}