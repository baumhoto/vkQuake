//
//  pl_ios.m
//  vkQuake
//
//  Created by Tobias Baumhöver on 14.07.21.
//

#import <UIKit/UIKit.h>

void PL_SetWindowIcon (void)
{
/* nothing to do on OS X */
}

void PL_VID_Shutdown (void)
{
}

char *PL_GetClipboardData (void)
{
    return NULL;
}

void PL_ErrorDialog(const char *errorMsg)
{
}

int GetScreenWidth(bool retina) {
    if (retina)
        return [[UIScreen mainScreen] bounds].size.width * [[UIScreen mainScreen] scale];
    
    return [[UIScreen mainScreen] bounds].size.width;
}


int GetScreenHeight(bool retina) {
    if (retina)
        return [[UIScreen mainScreen] bounds].size.height * [[UIScreen mainScreen] scale];
    
    return [[UIScreen mainScreen] bounds].size.height;
}
