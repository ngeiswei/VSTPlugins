// Original by:
// (c) 2018, Steinberg Media Technologies GmbH, All Rights Reserved
//
// Modified by:
// (c) 2019-2020 Takamitsu Endo
//
// This file is part of FDNCymbal.
//
// FDNCymbal is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// FDNCymbal is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with FDNCymbal.  If not, see <https://www.gnu.org/licenses/>.

#pragma once

#include "pluginterfaces/base/fplatform.h"

#define MAJOR_VERSION_STR "0"
#define MAJOR_VERSION_INT 0

#define SUB_VERSION_STR "2"
#define SUB_VERSION_INT 2

#define RELEASE_NUMBER_STR "16"
#define RELEASE_NUMBER_INT 16

#define BUILD_NUMBER_STR "23"
#define BUILD_NUMBER_INT 23

#define FULL_VERSION_STR                                                                 \
  MAJOR_VERSION_STR "." SUB_VERSION_STR "." RELEASE_NUMBER_STR "." BUILD_NUMBER_STR

#define VERSION_STR MAJOR_VERSION_STR "." SUB_VERSION_STR "." RELEASE_NUMBER_STR

#define stringPluginName "FDNCymbal0.2"

#define stringOriginalFilename "FDNCymbal.vst3"
#if SMTG_PLATFORM_64
#define stringFileDescription stringPluginName " VST3-SDK (64Bit)"
#else
#define stringFileDescription stringPluginName " VST3-SDK"
#endif
#define stringCompanyName "Uhhyou\0"
#define stringCompanyWeb ""
#define stringCompanyEmail "ryukau@gmail.com"

#define stringLegalCopyright "Copyright 2019-2020 Takamitsu Endo"
#define stringLegalTrademarks "VST is a trademark of Steinberg Media Technologies GmbH"
