pipeline{
        agent any
        stages{
                stage('---build-mongo---'){
                        steps{
                                sh "sudo docker-compose build mongo"
                        }
                }
                stage('---build-db-connector---'){
                        steps{
                                sh "sudo docker-compose build db-connector"
                        }
                }
                stage('---build-prizegen---'){
                        steps{
                                sh "sudo docker-compose build prize-generator"
                        }
                }
                stage('---build-textgen---'){
                        steps{
                                sh "sudo docker-compose build text-generator"
                        }
                }
                stage('---build-numgen---'){
                        steps{
                                sh "sudo docker-compose build number-generator"
                        }
                }
                stage('---push-mongo---'){
                        steps{
                                sh "sudo docker push teamdeadweight/mongo:latest"
                        }
                }
                stage('---push-db-connector---'){
                        steps{
                                sh "sudo docker push teamdeadweight/db_connector:latest"
                        }
                }
                stage('---push-numgen---'){
                        steps{
                                sh "sudo docker push teamdeadweight/number_generator:latest"
                        }
                }
                stage('---apply-mongo---'){
                        steps{
                                sh "kubectl apply -f mongo/pod.yaml -f mongo/service.yaml"
                        }
                }
                stage('---apply-db-connector---'){
                        steps{
                                sh "kubectl apply -f db_connector/pod.yaml -f db_connector/service.yaml"
                        }
                }
                stage('---apply-numgen---'){
                        steps{
                                sh "kubectl apply -f number_generator/deployment.yaml -f number_generator/service.yaml"
                        }
                }
                stage('---update-prizegen---'){
                        steps{
                                sh "kubectl set image deployments/prize-generator prize-generator=teamdeadweight/prize_generator:smallReward"
                                //sh "kubectl set image deployments/prize-generator prize-generator=teamdeadweight/prize_generator:bigReward"
                        }
                }           
                stage('---update-textgen---'){
                        steps{
                                sh "kubectl set image deployments/text-generator text-generator=teamdeadweight/text_generator:2charr"
                                //sh "kubectl set image deployments/text-generator text-generator=teamdeadweight/text_generator:3char"
                        }
                }                
                stage('---update-numgen---'){
                        steps{
                                //sh "kubectl set image deployments/number-generator number-generator=teamdeadweight/number_generator:8digit"
                                sh "kubectl set image deployments/number-generator number-generator=teamdeadweight/number_generator:6digit"
                        }
                }
        }
}
