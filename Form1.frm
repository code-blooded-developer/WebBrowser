VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "comctl32.ocx"
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Begin VB.Form Form1 
   Caption         =   "MaHek Explorer"
   ClientHeight    =   6675
   ClientLeft      =   180
   ClientTop       =   795
   ClientWidth     =   13980
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8124.428
   ScaleMode       =   0  'User
   ScaleWidth      =   14438.36
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin ComctlLib.Toolbar tb 
      Align           =   1  'Align Top
      Height          =   900
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   13980
      _ExtentX        =   24659
      _ExtentY        =   1588
      ButtonWidth     =   1323
      ButtonHeight    =   1429
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   327682
      BeginProperty Buttons {0713E452-850A-101B-AFC0-4210102A8DA7} 
         NumButtons      =   5
         BeginProperty Button1 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Back"
            Key             =   ""
            Object.Tag             =   ""
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Forward"
            Key             =   ""
            Object.Tag             =   ""
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Stop"
            Key             =   ""
            Object.Tag             =   ""
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Refresh"
            Key             =   ""
            Object.Tag             =   ""
            ImageIndex      =   4
         EndProperty
         BeginProperty Button5 {0713F354-850A-101B-AFC0-4210102A8DA7} 
            Caption         =   "Home"
            Key             =   ""
            Object.Tag             =   ""
            ImageIndex      =   5
         EndProperty
      EndProperty
      Begin VB.ComboBox Combo1 
         Height          =   315
         Left            =   4080
         TabIndex        =   2
         Text            =   "Combo1"
         Top             =   240
         Width           =   4935
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   495
      Left            =   16440
      TabIndex        =   4
      Top             =   240
      Width           =   615
   End
   Begin VB.CommandButton Command1 
      Height          =   495
      Left            =   16440
      TabIndex        =   3
      Top             =   240
      Width           =   615
   End
   Begin SHDocVwCtl.WebBrowser wb 
      Height          =   4455
      Left            =   120
      TabIndex        =   0
      Top             =   1080
      Width           =   8295
      ExtentX         =   14631
      ExtentY         =   7858
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   1800
      Top             =   6000
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   5
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Form1.frx":324A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Form1.frx":3564
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Form1.frx":387E
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Form1.frx":3B98
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Form1.frx":FBEA
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Click()
wb.Navigate Combo1.Text
End Sub

Private Sub Combo1_KeyPress(KeyAscii As Integer)
If KeyAscii = vbKeyReturn Then
Combo1_Click
End If
End Sub

Private Sub Command1_Click()
wb.GoSearch
End Sub

Private Sub Form_Load()
wb.Navigate "www.google.com"
Combo1.Text = "www.google.com"
Combo1.AddItem Combo1.Text
End Sub

Private Sub Form_Resize()
wb.Left = 0
wb.Top = tb.Height + 100
wb.Height = Form1.ScaleHeight
wb.Width = Form1.ScaleWidth
End Sub

Private Sub tb_ButtonClick(ByVal Button As ComctlLib.Button)
Select Case Button.Index
Case "1"
wb.GoBack
Case "2"
wb.GoForward
Case "3"
wb.Stop
Me.Caption = wb.LocationName
Case "4"
wb.Refresh
Case "5"
wb.GoHome
End Select
End Sub

Private Sub wb_DocumentComplete(ByVal pDisp As Object, URL As Variant)
Me.Caption = wb.LocationName
Combo1.Text = wb.LocationURL
Combo1.AddItem wb.LocationURL, 0
End Sub

