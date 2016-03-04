import groovy.json.JsonOutput

candidates = ['helloWorld', 'helloBrian']

println JsonOutput.toJson(['candidates': candidates])
