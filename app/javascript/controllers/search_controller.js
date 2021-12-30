
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "results", "form", "checkbox_age", "checkbox_subject", "age_list", "all_age_list", "subject_list", "all_subject_list", "age_count", "subject_count"]
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
    this.all_age_listTarget.classList.toggle(this.hiddenClass)
  }

  toggleSubjectList() {
    this.all_subject_listTarget.classList.toggle(this.hiddenClass)
  }

  hideAgeList() {
    this.all_age_listTarget.classList.add(this.hiddenClass)
  }

  hideSubjectList() {
    this.all_subject_listTarget.classList.add(this.hiddenClass)
  }

// Counting selected ages

  setCountAge() {
    if (this.hasAge_countTarget) {
      const count = this.selectedCheckboxesAge.length;
      if (count == 0 || count == this.checkboxes_age.length) {
        this.age_countTarget.innerHTML = "Будь-який вік";
        return this.checkboxes_age.filter((c) => c.checked = false);
      } else {
        this.age_countTarget.innerHTML = `Вік: ${count} вибрано`;
      }
    }
  }

  defaultAllAges() {
    if (this.selectedCheckboxesAge.length > 0) {
      this.checkbox_ageTarget.classList.add(this.checkboxClass);
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
    return new Array(...this.age_listTarget.querySelectorAll("input[type=checkbox]"));
  }

  get checkboxe_all_age() {
    return new Array(...this.all_age_listTarget.querySelectorAll("input[type=checkbox]"));
  }

  // Counting selected Subjects

  setCountSubject() {
    if (this.hasSubject_countTarget) {
      const count = this.selectedCheckboxesSubject.length;
      if (count == 0 || count == this.checkboxes_subject.length) {
        this.subject_countTarget.innerHTML = "Всі теми";
        return this.checkboxes_subject.filter((c) => c.checked = false)
      } else {
        this.subject_countTarget.innerHTML = `Теми: ${count} вибрано`;
      }
    }
  }

  defaultAllSubjects() {
    if (this.selectedCheckboxesSubject.length > 0) {
      this.checkbox_subjectTarget.classList.add(this.checkboxClass)
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
    return new Array(...this.subject_listTarget.querySelectorAll("input[type=checkbox]"));
  }

  get checkboxe_all_subject() {
    return new Array(...this.all_subject_listTarget.querySelectorAll("input[type=checkbox]"));
  }
}
