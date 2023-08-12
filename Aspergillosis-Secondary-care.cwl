cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  noninvasive-aspergillosis-secondary-care---secondary:
    run: noninvasive-aspergillosis-secondary-care---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  aspergillosis-secondary-care---secondary:
    run: aspergillosis-secondary-care---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: noninvasive-aspergillosis-secondary-care---secondary/output
  aspergillosis-secondary-care-aspergillusinduced---secondary:
    run: aspergillosis-secondary-care-aspergillusinduced---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: aspergillosis-secondary-care---secondary/output
  aspergillosis-secondary-care-sinus---secondary:
    run: aspergillosis-secondary-care-sinus---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: aspergillosis-secondary-care-aspergillusinduced---secondary/output
  pulmonary-aspergillosis-secondary-care---secondary:
    run: pulmonary-aspergillosis-secondary-care---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: aspergillosis-secondary-care-sinus---secondary/output
  tonsillar-aspergillosis-secondary-care---secondary:
    run: tonsillar-aspergillosis-secondary-care---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: pulmonary-aspergillosis-secondary-care---secondary/output
  aspergillosis-secondary-care-unspecified---secondary:
    run: aspergillosis-secondary-care-unspecified---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: tonsillar-aspergillosis-secondary-care---secondary/output
  aspergillosis-secondary-care-condition---secondary:
    run: aspergillosis-secondary-care-condition---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: aspergillosis-secondary-care-unspecified---secondary/output
  invasive-aspergillosis-secondary-care---secondary:
    run: invasive-aspergillosis-secondary-care---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: aspergillosis-secondary-care-condition---secondary/output
  other-aspergillosis-secondary-care---secondary:
    run: other-aspergillosis-secondary-care---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: invasive-aspergillosis-secondary-care---secondary/output
  aspergillosis-secondary-care-pneumonia---secondary:
    run: aspergillosis-secondary-care-pneumonia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: other-aspergillosis-secondary-care---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: aspergillosis-secondary-care-pneumonia---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
