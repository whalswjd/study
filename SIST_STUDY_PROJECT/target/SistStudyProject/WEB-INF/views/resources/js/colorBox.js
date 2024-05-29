/**
 * 컬러 박스 공통
 */
function fn_colorbox_close()
{
	if(parent)
	{
		if(parent.jQuery)
		{
			if(parent.jQuery.colorbox)
			{
				if(arguments != null && arguments.length > 0)
				{
					if(icia.common.type(arguments[0]) === "function")
					{
						arguments[0]();
					}	
				}
				
				parent.jQuery.colorbox.close();
			}
		}
	}
}
