variable "bucket_name" {
  description = "Name of the S3 bucket. If omitted, AWS will generate a unique name."
  type        = string
  default     = null
}

variable "enable_versioning" {
  description = "Enable S3 bucket versioning"
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "Default server-side encryption algorithm"
  type        = string
  default     = "AES256"
}

variable "enable_public_read" {
  description = "Whether to allow public read access (GetObject)"
  type        = bool
  default     = false
}

variable "force_destroy" {
  description = "Allow deleting bucket with non-empty content"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {}
}


