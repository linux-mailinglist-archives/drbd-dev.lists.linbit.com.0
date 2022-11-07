Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8847D621BC2
	for <lists+drbd-dev@lfdr.de>; Tue,  8 Nov 2022 19:21:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1A12F42178C;
	Tue,  8 Nov 2022 19:21:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 524 seconds by postgrey-1.31 at mail19;
	Mon, 07 Nov 2022 13:17:01 CET
Received: from fx.arvanta.net (static-213-198-238-194.adsl.eunet.rs
	[213.198.238.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7FEF24202F3
	for <drbd-dev@lists.linbit.com>; Mon,  7 Nov 2022 13:17:01 +0100 (CET)
Received: from m1 (ab.arvanta.net [10.5.1.5])
	by fx.arvanta.net (Postfix) with SMTP id 4D50227FE1
	for <drbd-dev@lists.linbit.com>; Mon,  7 Nov 2022 13:08:16 +0100 (CET)
Date: Mon, 7 Nov 2022 13:08:14 +0100
From: Milan =?utf-8?Q?P=2E_Stani=C4=87?= <mps@arvanta.net>
To: drbd-dev@lists.linbit.com
Message-ID: <Y2j1Lmr2afaEYvBu@m1>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 08 Nov 2022 19:21:09 +0100
Subject: [Drbd-dev] [BUG] drbdadm_parser.c:1968:63: error: 'glob_t' has no
 member named 'gl_flags'
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi,

[ Please Cc to me, I'm not subscribed to this mailing list ]

I'm trying to build drbd-tools 9.22.0 on Alpine Linux which is based on
musl libc (and not glibc).

Build fail with this error:
-----------------------------
drbdadm_parser.c: In function 'include_stmt':
drbdadm_parser.c:1968:63: error: 'glob_t' has no member named 'gl_flags'
 1968 |                         } else if (errno == ENOENT && glob_buf.gl_flags & GLOB_MAGCHAR) {
      |                                                               ^
drbdadm_parser.c:1968:75: error: 'GLOB_MAGCHAR' undeclared (first use in this function)
 1968 |                         } else if (errno == ENOENT && glob_buf.gl_flags & GLOB_MAGCHAR) {
      |                                                                           ^~~~~~~~~~~~
drbdadm_parser.c:1968:75: note: each undeclared identifier is reported only once for each function it appears in
make[1]: *** [<builtin>: drbdadm_parser.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory '/home/mps/aports/main/drbd-utils/src/drbd-utils-9.22.0/user/v9'
make: *** [Makefile:90: tools] Error 2
>>> ERROR: drbd-utils: build failed
-----------------------------

Musl libc glob.h doesn't have gl_flags nor GLOB_MAGCHAR because it is
non standard glibc extension.

I reverted https://github.com/LINBIT/drbd-utils/commit/4a1b590090bf676cdfb10c198505b95b9eeb3120
commit and then drbd-tools builds fine.

Not sure is this revert safe to push drbd-utils in next Alpine release
(which planned for next week) or there is better fix.

TIA

-- 
Kind regards
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
