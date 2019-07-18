pipeline{
        agent any
        stages{
                stage('---build-prizegen---'){
                        steps{
                                sh "docker-compose build prize-generator"
                        }
                }
                stage('---update-prizegen---'){
                        steps{
                                sh "kubectl set image deployments/prize-generator prize-generator=teamdeadweight/prize_generator:smallReward"
                                //sh "kubectl set image deployments/prize-generator prize-generator=teamdeadweight/prize_generator:bigReward"
                        }
                }
                stage('---build-textgen---'){
                        steps{
                                sh "docker-compose build text-generator"
                        }
                }
                stage('---update-textgen---'){
                        steps{
                                sh "kubectl set image deployments/text-generator text-generator=teamdeadweight/text_generator:2charr"
                                //sh "kubectl set image deployments/text-generator text-generator=teamdeadweight/text_generator:3char"
                        }
                }
                stage('---build-numgen---'){
                        steps{
                                sh "docker-compose build number-generator"
                        }
                }
                stage('---update-numgen---'){
                        steps{
                                sh "kubectl set image deployments/number-generator number-generator=teamdeadweight/number_generator:8digit"
                                //sh "kubectl set image deployments/number-generator number-generator=teamdeadweight/number_generator:6digit"
                        }
                }
        }
}
