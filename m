Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB3B21E82
	for <lists+drbd-dev@lfdr.de>; Tue, 12 Aug 2025 08:42:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A2AB8162275;
	Tue, 12 Aug 2025 08:41:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 362 seconds by postgrey-1.31 at mail19;
	Mon, 11 Aug 2025 15:22:13 CEST
Received: from mxout5.mail.janestreet.com (mxout5.mail.janestreet.com
	[64.215.233.18])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E9E3316064E
	for <drbd-dev@lists.linbit.com>; Mon, 11 Aug 2025 15:22:13 +0200 (CEST)
From: Eric Hagberg <ehagberg@janestreet.com>
To: christoph.boehmwalder@linbit.com
Subject: [PATCH] drbd: Remove the open-coded page pool
Date: Mon, 11 Aug 2025 09:16:02 -0400
Message-Id: <20250811131602.978555-1-ehagberg@janestreet.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250605103852.23029-1-christoph.boehmwalder@linbit.com>
References: <20250605103852.23029-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=janestreet.com;
	s=waixah; t=1754918170;
	bh=CfpxUiHBdhu2G6Ba7HFsEFU/rymlqX4utjgUVBB7ly4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KPQQCul03cpE2v3a8J/51343S4VrnSIKOwhxPcd4nx4XdeWfOssd4cmi3OKnwKjwr
	qbITIRUC+blle55bZ2n6o38qPRlA+Z7FDybdBzOXSZHSnhuf7F2n4GxmTbuXYXFo9v
	XKq6S43UG2b8hJpTeDfF/oUKGB7vvXfwrKEpIiIkdiXMe7jBNBBQIvwRlbf4EOJTIG
	Wo/8zx7mVhKNmOEaA2RXTpdPxvxY+WRbqVnbk3W29IEO0nf/gLL3qZ0G3a7jTm0iS9
	8+T9QFlQ7OsuEzQnURnQoJ+ueUUoY/GDDCqk9HGC8609FB3l4qWcKxVSdXrk60Du4O
	cbs0464r6Qp5g==
X-Mailman-Approved-At: Tue, 12 Aug 2025 08:41:51 +0200
Cc: axboe@kernel.dk, philipp.reisner@linbit.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Eric Hagberg <ehagberg@janestreet.com>,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

This patch has ben running on thousands of hosts here and we've not seen the memory leak that
was happening previously.

Tested-by: Eric Hagberg <ehagberg@janestreet.com>
