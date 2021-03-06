
##  digest -- hash digest functions for R
##
##  Copyright (C) 2003 - 2017  Dirk Eddelbuettel <edd@debian.org>
##
##  This file is part of digest.
##
##  digest is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 2 of the License, or
##  (at your option) any later version.
##
##  digest is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with digest.  If not, see <http://www.gnu.org/licenses/>.

.pkgenv <- new.env(parent=emptyenv())

.onLoad <- function(libname, pkgname) {
    ## we set a default level of two, with a possible override
    .pkgenv[["serializeVersion"]] <- getOption("serializeVersion", 2L)  # #nocov
    ## allow old crc32 behaviour
    .pkgenv[["crc32Preference"]] <- getOption("digestOldCRC32Format", FALSE)  # #nocov
}

.getSerializeVersion <- function() {
    ## return the options() value if set, otherwise the package env value
    ## doing it as a two-step ensure we can set a different default later
    getOption("serializeVersion", .pkgenv[["serializeVersion"]])
}

.getCRC32PreferOldOutput <- function() {
    ## return the options() value if set, otherwise the package env value
    ## doing it as a two-step ensure we can set a different default later
    getOption("digestOldCRC32Format", .pkgenv[["crc32Preference"]])
}
