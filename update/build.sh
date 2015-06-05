rm artifacts.* content.*
cp ../template/* .
eclipse \
	-nosplash \
	-application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher \
	-metadataRepository file:$PWD \
	-artifactRepository file:$PWD \
	-source $PWD \
	-publishArtifact \
	-compress
eclipse\
	-nosplash \
	-console -consolelog \
	-application org.eclipse.equinox.p2.publisher.CategoryPublisher \
	-metadataRepository file:$PWD \
	-categoryDefinition file:$PWD/category.xml \
	-categoryQualifier \
	-compress