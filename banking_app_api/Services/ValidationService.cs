namespace Banking_App_API.Services;

public static class ValidationService
{
    public static bool AllValid(params string?[] values)
    {
        if(values != null && values.Length > 0)
        {
            foreach(var val in values)
            {
                if (string.IsNullOrEmpty(val))
                    return false;
            }
        }

        return true;
    }

}