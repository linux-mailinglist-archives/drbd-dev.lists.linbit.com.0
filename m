Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D37611596
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Oct 2022 17:11:57 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A6F464252BE;
	Fri, 28 Oct 2022 17:11:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
	[209.85.167.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1859542037C
	for <drbd-dev@lists.linbit.com>; Fri, 28 Oct 2022 17:11:54 +0200 (CEST)
Received: by mail-oi1-f171.google.com with SMTP id l5so6434382oif.7
	for <drbd-dev@lists.linbit.com>; Fri, 28 Oct 2022 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:sender:from:to:cc:subject:date:message-id:reply-to;
	bh=cu5lq0+6QCF+BQfiaiaRxPUIRB+CVrNKwv+C5DY2DeE=;
	b=jrBrEVx/TWlLwC/EybmMjgT1gIVbiJljUHbETA5hqF92YxNbERFPM8SLV8vK+xyqHj
	9jS6lbrYopAtUqlTWoxmEhrkvVuOVnKHs18xrfkN3sQdJWGdEM8ayfOV6/rcHN9MyDGS
	idiwJN9NfCM2e8NN2NyJ75qSfH6Jw5L/noLRcBMacXiiXUYWcEoONMWesL4OC1T+SBSX
	zRJEmoAlv5F1PTO0uNPS0M5lwoafv7bkttb/uiMKOTZ5pxkfWBm0uH+r/cEtQLtmdLZy
	0aGvxyZT6rXQbiuz2oOdZEl+0+YjZU9rPHTO3PCCSEnn0aiYzAOnagzZG5lkxCKy6xOI
	2NeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:sender:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=cu5lq0+6QCF+BQfiaiaRxPUIRB+CVrNKwv+C5DY2DeE=;
	b=lA2aq7gct9SDyOxbXaGYgmRjby3b06fuqeKK+hX8Uc4vXuaSVtPmi5fMsfe4IOfn78
	yOwAbZlFnLq5Xy1n+k3McSnmJRXcp8klTa+F9C/0SX9aY9NCzKRfHwFmbig4lvons3sI
	8wZ/Po/QoIwLZDck8KRAJcyAevdjlR04YOfvMyahe50czQmP/Z046sbww426hCPZ1TZM
	+ct6l8kNKCGaywtjYCHsqvncr/4oEyu6JsNI1o/lWbNOfvKNfM+5cxSue3iaVV1K0pnt
	xJyoe3O8zJI7UqxLpzMUtLVAYJ6XCOFndYU1UQVc8qHBj0j+ER5DUd1MUTHdO+B7RNib
	bsiQ==
X-Gm-Message-State: ACrzQf2SVPj4xPmGmifWVDIrivDzZYeNaEGtS5HqLBTgx9VcUamlJlH4
	CvfwB3UXtrhA/E5BnrKChnc=
X-Google-Smtp-Source: AMsMyM5ueVBq7cyjALr6qHrZIqC5QSucVyONEpEUiPzqEpDhX0YcC10pHst5clJUzxGlqh+WW2rQcw==
X-Received: by 2002:aca:b443:0:b0:359:a4dd:c0 with SMTP id
	d64-20020acab443000000b00359a4dd00c0mr8575830oif.234.1666969914064;
	Fri, 28 Oct 2022 08:11:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
	([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	z21-20020a9d62d5000000b00666fdab9da7sm1739449otk.78.2022.10.28.08.11.51
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 28 Oct 2022 08:11:52 -0700 (PDT)
Message-ID: <6f04aec5-bbff-6154-a0b1-8ad0aec97ec5@roeck-us.net>
Date: Fri, 28 Oct 2022 08:11:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.2.2
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
References: <20221027150525.753064657@goodmis.org>
	<20221027150925.819019339@goodmis.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221027150925.819019339@goodmis.org>
Cc: Jens Axboe <axboe@kernel.dk>, Stephen Boyd <sboyd@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [RFC][PATCH v2 04/31] timers: block: Use
 del_timer_shutdown() before freeing timer
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 10/27/22 08:05, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> Before a timer is freed, del_timer_shutdown() must be called.
> 

I also had to add the following, as you had already suggested.

Just changing blk_sync_queue() was insufficient; I had to add the call from
blk_release_queue() because otherwise blk_sync_queue() was not always called.

Thanks,
Guenter

---
diff --git a/block/blk-core.c b/block/blk-core.c
index 17667159482e..69b1daa2e91a 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -227,7 +227,7 @@ const char *blk_status_to_str(blk_status_t status)
   */
  void blk_sync_queue(struct request_queue *q)
  {
-       del_timer_sync(&q->timeout);
+       del_timer_shutdown(&q->timeout);
         cancel_work_sync(&q->timeout_work);
  }
  EXPORT_SYMBOL(blk_sync_queue);
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index e71b3b43927c..12a1e46536ed 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -769,6 +769,8 @@ static void blk_release_queue(struct kobject *kobj)

         percpu_ref_exit(&q->q_usage_counter);

+       blk_sync_queue(q);
+
         if (q->poll_stat)
                 blk_stat_remove_callback(q, q->poll_cb);
         blk_stat_free_callback(q->poll_cb);

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
