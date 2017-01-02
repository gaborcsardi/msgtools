#' @rdname po_directory
#' @title Utilities for translation directory
#' @description Check for and create a /po directory
#' @template pkg
#' @return \code{check_for_po_dir} returns a logical. \code{make_po_dir} returns the path to the directory.
#' @examples
#' \dontrun{
#'   # from within a package directory
#'   if (!check_for_po_dir()) {
#'     make_po_dir()
#'   }
#' }
#' @export
check_for_po_dir <- function(pkg = ".") {
    pkg <- as.package(pkg)
    po_dir <- file.path(pkg$path, "po")
    if (!dir.exists(po_dir)) {
        make_po_dir(pkg)
    } else {
        return(TRUE)
    }
}

#' @rdname po_directory
#' @export
make_po_dir <- function(pkg = ".") {
    pkg <- as.package(pkg)
    po_dir <- file.path(pkg$path, "po")
    if (dir.exists(po_dir)) {
        #message("'/po' directory already exists for this package")
        return(po_dir)
    }
    dir.create(po_dir, FALSE)
    return(po_dir)
}