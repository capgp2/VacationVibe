# create an S3 bucket for our backend uploads
resource "aws_s3_bucket" "backend" {
  bucket        = "tripvibe"
  force_destroy = true

  tags = local.tags
}

resource "aws_s3_bucket_policy" "allow_access_from_backend" {
  bucket = aws_s3_bucket.backend.id
  policy = data.aws_iam_policy_document.allow_access_from_backend.json
}

data "aws_iam_policy_document" "allow_access_from_backend" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::183066416469:user/phil"]
    }

    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions",
      "s3:GetObject",
      "s3:GetBucketLocation",
      "s3:Get*",
      "s3:Put*"
    ]
    effect = "Allow"

    resources = [
      aws_s3_bucket.backend.arn,
      "${aws_s3_bucket.backend.arn}/*",
    ]
  }
}

# resource "aws_s3_bucket_ownership_controls" "backend" {
#   bucket = aws_s3_bucket.backend.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_acl" "backend" {
#   depends_on = [aws_s3_bucket_ownership_controls.backend]

#   bucket = aws_s3_bucket.backend.id
#   acl    = "private"
# }

# setup CORS
resource "aws_s3_bucket_cors_configuration" "backend" {
  bucket = aws_s3_bucket.backend.id

  cors_rule {
    allowed_headers = ["Authorization"]
    allowed_methods = ["PUT", "POST", "GET"]
    allowed_origins = ["*"]
    expose_headers  = []
    max_age_seconds = 3000
  }
}

locals {

  tags = {
    Owner       = "Capstone-Group02"
    Track       = "Cloud/DevOps"
    Environment = "Prod"
  }
}
