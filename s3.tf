resource "aws_s3_bucket" "ece592-week6-patelhe" {
  bucket = "ece592-week6-patelhe"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.a.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Name        = "ece592-week6-patelhe"
    Environment = "Dev"
  }
  versioning {
    enabled = true
  }
  lifecycle_rule {
    enabled = true

    expiration {
      days = 30
    }
  }

}

#End of S3 bucket default code

#Start of connecting Lambda and S3 together


resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "arn:aws:lambda:us-east-1:740455785879:function:week6-lambda"
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.ece592-week6-patelhe.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.ece592-week6-patelhe.id

  lambda_function {
    lambda_function_arn = "arn:aws:lambda:us-east-1:740455785879:function:week6-lambda"
    events              = ["s3:ObjectCreated:*"]
  }
}


