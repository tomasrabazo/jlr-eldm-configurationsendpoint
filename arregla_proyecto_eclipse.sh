#!/bin/bash
# WSO2 development script
#read -p "Proyect:" project
#path="$(pwd)"
#projectPath="$project"
#echo "($projectPath)"
#cd ${projectPath}
echo "(${PWD##*/)})"
echo '<?xml version="1.0" encoding="UTF-8"?><projectDescription>	<name>'${PWD##*/}'</name>	<comment></comment>	<projects>	</projects>	<buildSpec>	</buildSpec>	<natures><nature>org.wso2.developerstudio.eclipse.mavenmultimodule.project.nature</nature>	</natures></projectDescription>' > .project
for d in */ ; do
		name=$(echo $d| cut -d'/' -f 1)
		if [[ "$d" == *"CAR"* ]]; then
			echo "creating .project for CAR folder"
			echo '<?xml version="1.0" encoding="UTF-8"?><projectDescription><name>'${name}'</name><comment></comment>	<projects>	</projects>	<buildSpec>	</buildSpec>	<natures><nature>org.wso2.developerstudio.eclipse.distribution.project.nature</nature>	</natures></projectDescription>' > ${d}.project
		elif [[ "$d" == *"DSS"* ]]; then
			echo "creating .project for DSS folder"
			echo '<?xml version="1.0" encoding="UTF-8"?><projectDescription>	<name>'${name}'</name>	<comment></comment>	<projects>	</projects>	<buildSpec>	</buildSpec>	<natures><nature>org.wso2.developerstudio.eclipse.esb.project.nature</nature>	</natures></projectDescription>' > ${d}.project
		elif [[ ( "$d" == *"Resources"* ) || ( "$d" == *"GREG"* ) ]]; then
			echo "creating .project for GREG or Resources folder"
			echo '<?xml version="1.0" encoding="UTF-8"?><projectDescription>	<name>'${name}'</name>	<comment></comment>	<projects>	</projects>	<buildSpec><buildCommand><name>org.eclipse.jdt.core.javabuilder</name><arguments></arguments></buildCommand>	</buildSpec>	<natures><nature>org.wso2.developerstudio.eclipse.general.project.nature</nature><nature>org.eclipse.jdt.core.javanature</nature>	</natures></projectDescription>' > ${d}.project
		elif [[ "$d" == *"TEST"* ]]; then
			echo "creating .project for TEST folder"
			echo '<?xml version="1.0" encoding="UTF-8"?><projectDescription>	<name>'${name}'</name>	<comment></comment>	<projects>	</projects>	<buildSpec><buildCommand><name>org.eclipse.jdt.core.javabuilder</name><arguments></arguments></buildCommand><buildCommand><name>org.eclipse.m2e.core.maven2Builder</name><arguments></arguments></buildCommand>	</buildSpec>	<natures><nature>org.eclipse.jdt.core.javanature</nature><nature>org.eclipse.m2e.core.maven2Nature</nature>	</natures></projectDescription>' > ${d}.project
		elif [[ "$d" == *"API"* ]]; then
			echo "creating .project for FILES folder"
			echo '<?xml version="1.0" encoding="UTF-8"?><projectDescription>	<name>'${name}'</name>	<comment></comment>	<projects>	</projects>	<buildSpec><buildCommand><name>org.eclipse.jdt.core.javabuilder</name><arguments></arguments></buildCommand><buildCommand><name>org.eclipse.m2e.core.maven2Builder</name><arguments></arguments></buildCommand>	</buildSpec>	<natures><nature>org.eclipse.jdt.core.javanature</nature><nature>org.eclipse.m2e.core.maven2Nature</nature>	</natures></projectDescription>' > ${d}.project
		elif [[ "$d" == *"FILES"* ]]; then
			echo "creating .project for FILES folder"
			echo '<?xml version="1.0" encoding="UTF-8"?><projectDescription>	<name>'${name}'</name>	<comment></comment>	<projects>	</projects>	<buildSpec><buildCommand><name>org.eclipse.jdt.core.javabuilder</name><arguments></arguments></buildCommand><buildCommand><name>org.eclipse.m2e.core.maven2Builder</name><arguments></arguments></buildCommand>	</buildSpec>	<natures><nature>org.eclipse.jdt.core.javanature</nature><nature>org.eclipse.m2e.core.maven2Nature</nature>	</natures></projectDescription>' > ${d}.project
		elif [[ "$d" == *"SOAP"* ]]; then
			echo "creating .project for FILES folder"
			echo '<?xml version="1.0" encoding="UTF-8"?><projectDescription>	<name>'${name}'</name>	<comment></comment>	<projects>	</projects>	<buildSpec><buildCommand><name>org.eclipse.jdt.core.javabuilder</name><arguments></arguments></buildCommand><buildCommand><name>org.eclipse.m2e.core.maven2Builder</name><arguments></arguments></buildCommand>	</buildSpec>	<natures><nature>org.eclipse.jdt.core.javanature</nature><nature>org.eclipse.m2e.core.maven2Nature</nature>	</natures></projectDescription>' > ${d}.project
		elif [[ "$d" == *"ESB"* ]]; then
			echo "creating .project for ESB folder"
			echo '<?xml version="1.0" encoding="UTF-8"?><projectDescription>	<name>'${name}'</name>	<comment></comment>	<projects>	</projects>	<buildSpec>	</buildSpec>	<natures><nature>org.wso2.developerstudio.eclipse.esb.project.nature</nature>	</natures></projectDescription>' > ${d}.project
		fi
done
echo "All .project files have been created...."
