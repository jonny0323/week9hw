function makeScheduleEvent() {
    var time = document.getElementById('time').value;
    var text = document.getElementById('text').value;

    if (!time) {
        alert("시간을 입력해주세요")
        return;
    }
    if (!text) {
        alert("일정을 입력해주세요")
        return;
    }

    location.href = `makeScheduleAction.jsp?time=` + document.getElementById('time').value + "&text=" + document.getElementById('text').value + "&year= <%= yearValue %> &month= " + document.getElementById('text').value + "&day=" + document.getElementById('text').value;
}

function changeScheduleEvent() {
    window.open
}
function deleteScheduleEvent() {
    location.href = 'deleteSchedule.jsp'

}