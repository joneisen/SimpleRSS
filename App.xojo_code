#tag Class
Protected Class App
Inherits Application
	#tag Method, Flags = &h0
		Function isValidURL(url as String) As Boolean
		  Dim r As New RegEx
		  
		  r.SearchPattern = "((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)"
		  
		  Return (r.Search(url) <> Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceUnicodeCharacters(Content as String) As String
		  While Content.InStr( "&#" ) > 0
		    Dim start As Integer = Content.InStr( "&#" )
		    Dim stop As Integer = Content.InStr( start, ";" )
		    Dim rlen As Integer = stop - start + 1
		    Dim ulen As Integer = stop - start - 2
		    Dim rep As String = Content.Mid( start, rlen )
		    Dim ucode As String = Content.Mid( start + 2, ulen )
		    Content = Content.ReplaceAll( rep, Text.FromUnicodeCodepoint( ucode.Val ) )
		  Wend
		  Return Content
		End Function
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
