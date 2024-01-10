/*
 *  Copyright (c) Erik Doernenburg and contributors
 *  Licensed under the Apache License, Version 2.0 (the "License"); you may
 *  not use these files except in compliance with the License.
 */

import SwiftUI

// TODO: consider using https://github.com/sindresorhus/Defaults

public enum DefaultsKey: String {
    case
    // TODO: consider moving tokens to keychain, see https://swiftwithmajid.com/2021/08/11/how-to-create-a-property-wrapper-in-swift/
    pipelineList = "pipelines",
    cachedGitHubToken = "GitHubToken",
    useColorInMenuBar = "UseColorInMenuBar",
    useColorInMenuBarFailedOnly = "UseColorOnlyForFailedStateInMenuBar",
    showBuildTimerInMenuBar = "ShowTimerInMenu",
    showBuildTimesInMenu = "ShowLastBuildTimes",
    showBuildLabelsInMenu = "ShowLastBuildLabel",
    showStatusInWindow = "ShowPipelineStatusInWindow",
    showAvatarsInWindow = "ShowAvatarsInWindow",
    showMessagesInWindow = "ShowPipelineMessagesInWindow"
}

extension UserDefaults {
    public static var active = {
        let d = UserDefaults(suiteName: "org.ccmenu.tempdomain")
        d?.removePersistentDomain(forName: "org.ccmenu.tempdomain")
        return d
    }()
}

extension AppStorage {

    public init(wrappedValue: Value, _ key: DefaultsKey) where Value == Bool {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: UserDefaults.active)
    }

    public init(wrappedValue: Value, _ key: DefaultsKey) where Value == String {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: UserDefaults.active)
    }

}
