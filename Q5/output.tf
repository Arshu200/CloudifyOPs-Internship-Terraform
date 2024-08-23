# output "role_name" {
#   value = aws_iam_role.s3_role.name
# }

# output "role_policy" {
#     value = aws_iam_role.s3_role.policy 
# }

output "policy_name" {
  value = aws_iam_policy.s3_read_only_policy.name
}

output "policy_name_policy" {
  value = aws_iam_policy.s3_read_only_policy.policy
}

output "policy_id" {
  value = aws_iam_policy.s3_read_only_policy.policy_id
}