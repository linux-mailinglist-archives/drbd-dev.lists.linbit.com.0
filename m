Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 732D1427FB
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 15:51:04 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 3670A1028A78;
	Wed, 12 Jun 2019 15:50:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com
	[209.85.166.180])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 141CA1028A61
	for <drbd-dev@lists.linbit.com>; Wed,  5 Jun 2019 17:59:34 +0200 (CEST)
Received: by mail-it1-f180.google.com with SMTP id w190so2863245itc.5
	for <drbd-dev@lists.linbit.com>; Wed, 05 Jun 2019 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=Ocxi8MWR46aRsukQmGivUqnlR8XJpdGP8W0cOBCvwGE=;
	b=OdvYBRS1opj+zNJ6q2vTC3OnmhZzPyCF9MVAhLtSifXG0QK0pbhFqdzJKCviKBfXMy
	DHW/OoheqFG6WjgDjAJ8r+dv184LEy8CV31VGODMOv0vi9/ZiJUansMlDylYwqvdSU0o
	1cb0Pn9bWI29xs3hGi/oB0CsxLLJTzARilQNUHaZefZEuTTxzdJ+i1NhM9zX1tinBe4i
	QZlLU9w4zdxqpaJU5UkGV2HF64N1+v6KkHvy1VOPzgFzPlw4W/z9ONpQdPI9R1WX0zL5
	Uc0nPHVtCOrKYhjsJKSFh6J0FHH/sx8qbG2KIm0+8ehP23VFZWv/xkZSKJjRLf9EWM5R
	7EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=Ocxi8MWR46aRsukQmGivUqnlR8XJpdGP8W0cOBCvwGE=;
	b=dK9WpLFl+jmCqqQ8kxBqZGPm7dOKiMqRBVhc6NlTXrBcQ0kH2HNtYxuCcb8TdKzqif
	YY/oa/6ddDBUZ2wV20faBHBGiTVxE3vzfLxwV5hNIZZ3B7QCB+JMUL/9NJUGxHDCEn3/
	5XvMvxQNPLOlKPhZAUNZbOxDs7o0Zjg/iJuA3NN/M/eKxH4SD2obTBxdDDMRM1+BwEoH
	eM7PaAsMIFpcyXuKfBm4IwbPs289ZLsjZE6VPoB+SzW0jtrePbov7lIRVsNTl9KtLVbG
	syQI9CQzv2Bb4g+iJTKnE4cbuDVvpyDn8vw9RrWvOYLU12eHnnGDbjHYAIx9O0UIAxnI
	y1vA==
X-Gm-Message-State: APjAAAXVsVQt3dTpJ1ckJiffQ4farvR1o2jrr/Unc03eCYj76O4IrmNY
	H8WkkvFKwrWjKa8GW2YkwCr+ZhB5
X-Google-Smtp-Source: APXvYqxrwRq/RyLSVk5Tv2yl2bS0P8JacVxt7+x9nKlVYLJkZk+82/sPwpNgALtMFCwsceukHUUABg==
X-Received: by 2002:a02:1948:: with SMTP id b69mr4340551jab.55.1559750373929; 
	Wed, 05 Jun 2019 08:59:33 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	j23sm9009813itk.30.2019.06.05.08.59.31
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 08:59:33 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <59aa5c8c-7369-e987-4b7c-63490498570e@gmail.com>
Date: Wed, 5 Jun 2019 09:59:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Jun 2019 15:50:54 +0200
Subject: [Drbd-dev] schedule_timeout() called without setting task state
	first
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

The logic in new_or_recycle_send_buffer_page() calls schedule_timeout() without first setting
the task state.  This will merely yield the processor but not actually wait.  Is that intended?

In drbd_main.c:
968 static void new_or_recycle_send_buffer_page(struct drbd_send_buffer *sbuf)
969 {
970         while (1) {
971                 struct page *page;
972                 int count = page_count(sbuf->page);
973
974                 BUG_ON(count == 0);
975                 if (count == 1)
976                         goto have_page;
977
978                 page = alloc_page(GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
979                 if (page) {
980                         put_page(sbuf->page);
981                         sbuf->page = page;
982                         goto have_page;
983                 }
984
985                 //XXX Don't you need to set something like TASK_*INTERRUPTIBLE first?
986                 //XXX I think this just yields the processor but the thread remains runnable(?)
987                 schedule_timeout(HZ / 10);
988         }
989 have_page:
990         sbuf->unsent =
991         sbuf->pos = page_address(sbuf->page);
992 }
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
