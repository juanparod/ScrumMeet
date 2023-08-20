//
//  ScrumMeetTests.swift
//  ScrumMeetTests
//
//  Created by Juan Pablo Rodriguez on 12/08/23.
//

import XCTest
@testable import ScrumMeet

final class ScrumMeetTests: XCTestCase {

    func test_createMeeting() throws {
        // Arrange
        let viewModel = MeetingsListViewModel()

        // Act
        viewModel.createMeeting()

        // Assert
        XCTAssertEqual(viewModel.meetings.count, 1)
        XCTAssertEqual(viewModel.navigationPath[0], .meeting(viewModel.meetings[0].id))
    }

    func test_deleteMeeting() throws {
        // Arrange
        let viewModel = MeetingsListViewModel()
        let meeting1 = Meeting()
        let meeting2 = Meeting()
        viewModel.meetings = [meeting1, meeting2]

        // Act
        viewModel.deleteMeeting(at: [0])

        // Assert
        XCTAssertEqual(viewModel.meetings.count, 1)
        XCTAssertEqual(viewModel.meetings[0], meeting2)
    }

    func test_setCurrentMeeting() {
        // Arrange
        let viewModel = MeetingsListViewModel()
        let meeting1 = Meeting()
        let meeting2 = Meeting()
        viewModel.meetings = [meeting1, meeting2]

        // Act
        viewModel.setMeeting(for: meeting2.id)

        // Assert
        XCTAssertEqual(viewModel.currentMeetingIndex, 1)
    }

    func test_popNavigation() {
        // Arrange
        let viewModel = MeetingsListViewModel()
        let meeting = NavigationPath.meeting("1")
        let status = NavigationPath.status("A")
        viewModel.navigationPath = [meeting, status]

        // Act
        viewModel.popNavigation()

        // Assert
        XCTAssertEqual(viewModel.navigationPath.count, 1)
        XCTAssertEqual(viewModel.navigationPath.last, meeting)
    }
}
