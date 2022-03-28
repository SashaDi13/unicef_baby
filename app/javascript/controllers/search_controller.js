
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "results", "form", "checkboxAge", "checkboxSubject", "ageList", "allAgeList", "subjectList", "allSubjectList", "ageCount", "subjectCount"]
  static classes = [ "hidden", "checkbox" ]

  connect() {
    this.setCountAge()
    this.setCountSubject()
    this.defaultAllAges()
    this.defaultAllSubjects()
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      // This needs a polyfill for Safari and IE11 support. Alternatively, use Rails/ujs:
      // Rails.fire(this.formTarget, 'submit')
      this.formTarget.requestSubmit()
    }, 2000)
  }

  toggleAgeList() {
    this.allAgeListTarget.classList.toggle(this.hiddenClass)
  }

  toggleSubjectList() {
    this.allSubjectListTarget.classList.toggle(this.hiddenClass)
  }

  hideAgeList() {
    this.allAgeListTarget.classList.add(this.hiddenClass)
  }

  hideSubjectList() {
    this.allSubjectListTarget.classList.add(this.hiddenClass)
  }

// Counting selected ages

  setCountAge() {
    if (this.hasageCountTarget) {
      const count = this.selectedCheckboxesAge.length;
      if (count == 0 || count == this.checkboxes_age.length) {
        this.ageCountTarget.innerHTML = "Будь-який вік";
        return this.checkboxes_age.filter((c) => c.checked = false);
      } else {
        this.ageCountTarget.innerHTML = `Вік: ${count} вибрано`;
      }
    }
  }

  defaultAllAges() {
    if (this.selectedCheckboxesAge.length > 0) {
      this.checkboxAgeTarget.classList.add(this.checkboxClass);
      this.selectedCheckboxeAllAge[0].checked = false;
    }
  }

  setAllAges() {
    if (this.selectedCheckboxeAllAge[0].checked){
      this.selectedCheckboxeAllAge[0].checked = true;
      return this.checkboxes_age.filter((c) => c.checked = false);
    }
  }

  get selectedCheckboxesAge() {
    return this.checkboxes_age.filter((c) => c.checked);
  }

  get selectedCheckboxeAllAge() {
    return this.checkboxe_all_age.filter((c) => c.checked);
  }

  get checkboxes_age() {
    return new Array(...this.ageListTarget.querySelectorAll("input[type=checkbox]"));
  }

  get checkboxe_all_age() {
    return new Array(...this.allAgeListTarget.querySelectorAll("input[type=checkbox]"));
  }

  // Counting selected Subjects

  setCountSubject() {
    if (this.hassubjectCountTarget) {
      const count = this.selectedCheckboxesSubject.length;
      if (count == 0 || count == this.checkboxes_subject.length) {
        this.subjectCountTarget.innerHTML = "Всі теми";
        return this.checkboxes_subject.filter((c) => c.checked = false)
      } else {
        this.subjectCountTarget.innerHTML = `Теми: ${count} вибрано`;
      }
    }
  }

  defaultAllSubjects() {
    if (this.selectedCheckboxesSubject.length > 0) {
      this.checkboxSubjectTarget.classList.add(this.checkboxClass)
      this.selectedCheckboxeAllSubject[0].checked = false;
    }
  }

  setAllSubjects() {
    if (this.selectedCheckboxeAllSubject[0].checked){
       this.selectedCheckboxeAllSubject[0].checked = true;
      return this.checkboxes_subject.filter((c) => c.checked = false);
    }
  }

  get selectedCheckboxesSubject() {
    return this.checkboxes_subject.filter((c) => c.checked);
  }

  get selectedCheckboxeAllSubject() {
    return this.checkboxe_all_subject.filter((c) => c.checked);
  }

  get checkboxes_subject() {
    return new Array(...this.subjectListTarget.querySelectorAll("input[type=checkbox]"));
  }

  get checkboxe_all_subject() {
    return new Array(...this.allSubjectListTarget.querySelectorAll("input[type=checkbox]"));
  }
}
